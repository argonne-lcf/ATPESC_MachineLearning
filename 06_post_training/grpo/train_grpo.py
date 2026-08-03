#!/usr/bin/env python3
"""
GRPO training for the Countdown game on Aurora (Intel XPU).

Trains Qwen2.5-3B-Instruct to solve Countdown-style arithmetic puzzles using
Group Relative Policy Optimization (GRPO). Given a target integer and a
set of numbers, the model learns to produce an arithmetic expression
that equals the target.

A single TinyZero-style reward function scores each completion:
  0.0  — no <answer> tags found
  0.1  — valid format but wrong answer or wrong numbers
  1.0  — correct answer using exactly the provided numbers

Supports FSDP (default, required for 3B) and DDP (--no_fsdp, for smaller models).
"""

import os
import json
import random
import argparse

try:
    from mpi4py import MPI
except ImportError:
    pass

import torch
import datasets
from transformers import AutoTokenizer, AutoModelForCausalLM, AutoConfig
from transformers.trainer_utils import get_last_checkpoint
from trl import GRPOConfig, GRPOTrainer

from countdown_rewards import countdown_reward


def parse_args():
    p = argparse.ArgumentParser(description="Countdown GRPO on Aurora (Intel XPU)")
    p.add_argument("--model_id", required=True)
    p.add_argument("--output_dir", default="./output/GRPO")
    p.add_argument("--dataset", type=str, default=None,
                   help="Path to countdown JSONL file (if omitted, generates synthetic data)")
    p.add_argument("--num_samples", type=int, default=5000,
                   help="Number of synthetic samples when no dataset is provided")

    # GRPO hyperparams
    p.add_argument("--num_generations", type=int, default=8)
    p.add_argument("--max_completion_length", type=int, default=256)
    p.add_argument("--temperature", type=float, default=1.0)
    p.add_argument("--beta", type=float, default=0.0,
                   help="KL coefficient (0 = no reference model, saves memory)")
    p.add_argument("--loss_type", type=str, default="grpo",
                   choices=["grpo", "dapo", "dr_grpo", "bnpo"])
    p.add_argument("--num_iterations", type=int, default=2)
    p.add_argument("--epsilon", type=float, default=0.2)
    p.add_argument("--scale_rewards", type=str, default="group",
                   choices=["group", "batch", "none"])
    p.add_argument("--reward_weights", type=float, nargs="+", default=None,
                   help="Weights for [format, usage, value] reward functions")

    # Training schedule
    p.add_argument("--max_steps", type=int, default=400)
    p.add_argument("--batch_size", type=int, default=4)
    p.add_argument("--grad_accum", type=int, default=2)
    p.add_argument("--lr", type=float, default=1e-6)
    p.add_argument("--warmup_steps", type=int, default=50)
    p.add_argument("--weight_decay", type=float, default=0.01)
    p.add_argument("--lr_scheduler", type=str, default="linear")

    # Distribution strategy
    p.add_argument("--no_fsdp", action="store_true",
                   help="Use DDP instead of FSDP. Recommended for 1.7B on Aurora.")
    p.add_argument("--fsdp_transformer_layer_cls", type=str, default="LlamaDecoderLayer")

    # Checkpointing / logging
    p.add_argument("--save_steps", type=int, default=100)
    p.add_argument("--save_limit", type=int, default=5)
    p.add_argument("--logging_steps", type=int, default=10)
    p.add_argument("--log_completions", action="store_true")
    p.add_argument("--num_workers", type=int, default=0)

    return p.parse_args()


OPS = ["+", "-", "*"]


def _make_prompt(target: int, numbers: list[int]) -> list[dict]:
    content = (
        f"Using the numbers {numbers}, create an equation that equals {target}. "
        "You can use basic arithmetic operations (+, -, *) and each number can only be used once. "
        "Show your work in <think> </think> tags. And return the final answer in "
        "<answer> </answer> tags, for example <answer> (1 + 2) * 3 </answer>."
    )
    return [{"role": "user", "content": content}]


def _combine(a_val, a_expr, b_val, b_expr, op):
    if op == "+":
        return a_val + b_val, f"({a_expr} + {b_expr})"
    if op == "-":
        return a_val - b_val, f"({a_expr} - {b_expr})"
    if op == "*":
        return a_val * b_val, f"({a_expr} * {b_expr})"
    raise ValueError(f"Unsupported op: {op}")


def _build_instance(min_n=3, max_n=3, min_val=1, max_val=50,
                    min_target=1, max_target=999, max_attempts=1000):
    for _ in range(max_attempts):
        n = random.randint(min_n, max_n)
        numbers = [random.randint(min_val, max_val) for _ in range(n)]
        working = [(v, str(v)) for v in numbers]
        while len(working) > 1:
            i, j = sorted(random.sample(range(len(working)), 2), reverse=True)
            left, right = working.pop(i), working.pop(j)
            a, b = (left, right) if random.random() < 0.5 else (right, left)
            op = random.choice(OPS)
            value, expr = _combine(a[0], a[1], b[0], b[1], op)
            working.append((value, expr))
        target, solution = working[0]
        if min_target <= target <= max_target:
            return {
                "prompt": _make_prompt(target, numbers),
                "target": target,
                "numbers": numbers,
                "solution": solution,
            }
    raise RuntimeError(f"Failed after {max_attempts} attempts")


def load_synthetic_dataset(num_samples: int):
    rows = [_build_instance() for _ in range(num_samples)]
    return datasets.Dataset.from_list(rows)


def load_jsonl_dataset(path: str):
    rows = []
    with open(path) as fh:
        for line in fh:
            line = line.strip()
            if not line:
                continue
            obj = json.loads(line)
            if not all(k in obj for k in ("target", "numbers")):
                continue
            prompt = obj.get("prompt")
            if isinstance(prompt, str):
                prompt = [{"role": "user", "content": prompt}]
            elif not prompt:
                prompt = _make_prompt(obj["target"], obj["numbers"])
            rows.append({
                "prompt": prompt,
                "target": int(obj["target"]),
                "numbers": [int(x) for x in obj["numbers"]],
            })
    return datasets.Dataset.from_list(rows)


def load_model_ddp(model_id: str, dtype=torch.bfloat16):
    model = AutoModelForCausalLM.from_pretrained(
        model_id, dtype=dtype, attn_implementation="sdpa",
        low_cpu_mem_usage=True, device_map="cpu",
    )
    model.config.use_cache = False
    return model


def load_model_fsdp(model_id: str, rank: int, dtype=torch.bfloat16):
    cfg = AutoConfig.from_pretrained(model_id)
    if rank == 0:
        model = AutoModelForCausalLM.from_pretrained(
            model_id, config=cfg, dtype=dtype, attn_implementation="sdpa",
            low_cpu_mem_usage=True, device_map="cpu",
        )
    else:
        with torch.device("meta"):
            model = AutoModelForCausalLM.from_config(cfg, dtype=dtype, attn_implementation="sdpa")
    model.config.use_cache = False
    if rank == 0:
        n = sum(p.numel() for p in model.parameters()) / 1e9
        print(f"[Rank 0] Loaded {n:.1f}B params", flush=True)
    return model


def make_fsdp_kwargs(transformer_layer_cls: str = "LlamaDecoderLayer") -> dict:
    return {
        "fsdp": "full_shard auto_wrap",
        "fsdp_config": {
            "fsdp_version": 2,
            "transformer_layer_cls_to_wrap": transformer_layer_cls,
            "activation_checkpointing": True,
            "sync_module_states": True,
            "cpu_ram_efficient_loading": True,
        },
    }


def main():
    args = parse_args()

    rank = int(os.environ.get("RANK", 0))
    world_size = int(os.environ.get("WORLD_SIZE", 1))
    is_main = (rank == 0)

    # ── Dataset ──────────────────────────────────────────────────────────────
    if args.dataset is not None:
        dataset = load_jsonl_dataset(args.dataset)
        if is_main:
            print(f"[Dataset] JSONL {len(dataset):,} samples from {args.dataset}", flush=True)
    else:
        dataset = load_synthetic_dataset(args.num_samples)
        if is_main:
            print(f"[Dataset] Synthetic {len(dataset):,} samples", flush=True)

    # ── Tokenizer ────────────────────────────────────────────────────────────
    tokenizer = AutoTokenizer.from_pretrained(args.model_id)
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token

    # ── Model ────────────────────────────────────────────────────────────────
    if args.no_fsdp:
        model = load_model_ddp(args.model_id)
    else:
        model = load_model_fsdp(args.model_id, rank)

    # ── Training config ──────────────────────────────────────────────────────
    os.environ.setdefault("WANDB_MODE", "offline")

    train_kw = dict(
        output_dir=args.output_dir,
        max_steps=args.max_steps,
        per_device_train_batch_size=args.batch_size,
        gradient_accumulation_steps=args.grad_accum,
        learning_rate=args.lr,
        lr_scheduler_type=args.lr_scheduler,
        warmup_steps=args.warmup_steps,
        weight_decay=args.weight_decay,
        bf16=True,
        do_eval=False,
        logging_steps=args.logging_steps,
        logging_first_step=True,
        save_strategy="steps",
        save_steps=args.save_steps,
        save_total_limit=args.save_limit,
        dataloader_num_workers=args.num_workers,
        report_to=os.environ.get("REPORT_TO", "none"),
        num_generations=args.num_generations,
        max_completion_length=args.max_completion_length,
        temperature=args.temperature,
        beta=args.beta,
        loss_type=args.loss_type,
        num_iterations=args.num_iterations,
        epsilon=args.epsilon,
        scale_rewards=args.scale_rewards,
        log_completions=args.log_completions,
        gradient_checkpointing=True,
        gradient_checkpointing_kwargs={"use_reentrant": False},
    )

    if args.reward_weights is not None:
        train_kw["reward_weights"] = args.reward_weights

    if not args.no_fsdp:
        train_kw["gradient_checkpointing"] = False
        train_kw.pop("gradient_checkpointing_kwargs", None)
        train_kw.update(make_fsdp_kwargs(
            transformer_layer_cls=args.fsdp_transformer_layer_cls,
        ))

    training_args = GRPOConfig(**train_kw)

    if is_main:
        mode = "DDP" if args.no_fsdp else "FSDP"
        print(f"[Config] {mode}  lr={args.lr}  batch={args.batch_size}  "
              f"grad_accum={args.grad_accum}  max_steps={args.max_steps}", flush=True)

    # ── Trainer ──────────────────────────────────────────────────────────────
    reward_fns = [countdown_reward]

    trainer = GRPOTrainer(
        model=model,
        train_dataset=dataset,
        reward_funcs=reward_fns,
        args=training_args,
        processing_class=tokenizer,
    )
    if hasattr(trainer.model, "config"):
        trainer.model.config.use_cache = False

    # ── Resume ───────────────────────────────────────────────────────────────
    checkpoint = (
        get_last_checkpoint(args.output_dir)
        if os.path.isdir(args.output_dir) else None
    )
    if checkpoint and is_main:
        print(f"[Resume] {checkpoint}", flush=True)

    if is_main:
        print("Starting GRPO training...", flush=True)
    trainer.train(resume_from_checkpoint=checkpoint)
    if is_main:
        print("Training complete.", flush=True)


if __name__ == "__main__":
    main()
