#!/usr/bin/env python3
"""
SFT training for SmolLM2-1.7B on Aurora (Intel XPU).

Supports full fine-tuning
with DDP (--no_fsdp) or FSDP2, assistant-only loss masking, and streaming
JSONL datasets with a 'messages' column.
"""

import os
import glob
import json
import argparse

try:
    from mpi4py import MPI
except ImportError:
    pass

import torch
import datasets
from transformers import AutoTokenizer, AutoModelForCausalLM, AutoConfig
from transformers.trainer_utils import get_last_checkpoint
from trl import SFTConfig, SFTTrainer


DEFAULT_SYSTEM = (
    "You are a helpful, respectful and honest assistant. "
    "Always answer as helpfully as possible, while being safe."
)

CHATML_TEMPLATE_PATH = os.path.join(os.path.dirname(__file__), "chatml.jinja")


def parse_args():
    p = argparse.ArgumentParser(description="SFT on Aurora (Intel XPU)")
    p.add_argument("--model_id",   required=True)
    p.add_argument("--output_dir", default="./output/SFT")
    p.add_argument("--dataset", required=True, nargs="+",
                   help="Path(s) or glob pattern(s) to JSONL files with 'messages' column")
    p.add_argument("--max_seq_length", type=int, default=2048)

    p.add_argument("--max_steps",    type=int,   default=None)
    p.add_argument("--num_epochs",   type=int,   default=3)
    p.add_argument("--batch_size",   type=int,   default=4)
    p.add_argument("--grad_accum",   type=int,   default=1)
    p.add_argument("--lr",           type=float, default=2e-5)
    p.add_argument("--warmup_steps", type=int,   default=50)
    p.add_argument("--weight_decay", type=float, default=0.01)
    p.add_argument("--lr_scheduler", type=str,   default="cosine")

    p.add_argument("--no_fsdp", action="store_true",
                   help="Use DDP instead of FSDP. Recommended for models that "
                        "fit in a single XPU (e.g. 1.7B on Aurora's 64 GB HBM).")
    p.add_argument("--fsdp_transformer_layer_cls", type=str, default="LlamaDecoderLayer")
    p.add_argument("--all_ranks_load", action="store_true",
                   help="Every rank loads model from disk (for node-local staged models).")

    p.add_argument("--save_steps",    type=int, default=50)
    p.add_argument("--save_limit",    type=int, default=5)
    p.add_argument("--logging_steps", type=int, default=5)
    p.add_argument("--num_workers",   type=int, default=0)

    return p.parse_args()


def load_jsonl_dataset(paths_or_globs: list):
    """Returns (IterableDataset, total_sample_count)."""
    files = []
    for pattern in paths_or_globs:
        matched = sorted(glob.glob(pattern))
        files.extend(matched if matched else [pattern])
    if not files:
        raise ValueError(f"No files found for: {paths_or_globs}")

    def _gen():
        for fp in files:
            with open(fp) as fh:
                for line in fh:
                    line = line.strip()
                    if not line:
                        continue
                    try:
                        obj = json.loads(line)
                    except json.JSONDecodeError:
                        continue
                    msgs = obj if isinstance(obj, list) else obj.get("messages")
                    if not msgs:
                        continue
                    if msgs[0].get("role") != "system":
                        msgs = [{"role": "system", "content": DEFAULT_SYSTEM}] + msgs
                    yield {"messages": msgs}

    total = sum(1 for fp in files for ln in open(fp) if ln.strip())
    ds = datasets.IterableDataset.from_generator(
        _gen,
        features=datasets.Features({
            "messages": [
                {"role": datasets.Value("string"), "content": datasets.Value("string")}
            ]
        }),
    )
    return ds, total


def load_model_ddp(model_id: str, dtype=torch.bfloat16):
    model = AutoModelForCausalLM.from_pretrained(
        model_id, dtype=dtype, attn_implementation="sdpa",
        low_cpu_mem_usage=True, device_map="cpu",
    )
    model.config.use_cache = False
    return model


def load_model_fsdp(model_id: str, rank: int, dtype=torch.bfloat16,
                    all_ranks_load: bool = False):
    if all_ranks_load:
        model = AutoModelForCausalLM.from_pretrained(
            model_id, dtype=dtype, attn_implementation="sdpa",
            low_cpu_mem_usage=True, device_map="cpu",
        )
    else:
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


def make_fsdp_kwargs(all_ranks_load: bool = False,
                     transformer_layer_cls: str = "LlamaDecoderLayer") -> dict:
    return {
        "fsdp": "full_shard auto_wrap",
        "fsdp_config": {
            "fsdp_version": 2,
            "transformer_layer_cls_to_wrap": transformer_layer_cls,
            "activation_checkpointing": True,
            "sync_module_states": not all_ranks_load,
            "cpu_ram_efficient_loading": not all_ranks_load,
        },
    }


def main():
    args = parse_args()

    rank       = int(os.environ.get("RANK", 0))
    world_size = int(os.environ.get("WORLD_SIZE", 1))
    is_main    = (rank == 0)
    all_ranks_load = args.all_ranks_load or os.environ.get("FSDP_ALL_RANKS_LOAD", "") == "1"

    # ── Dataset ──────────────────────────────────────────────────────────────
    dataset, total_samples = load_jsonl_dataset(args.dataset)
    effective_batch = args.batch_size * world_size * args.grad_accum
    max_steps = max(1, (total_samples // effective_batch) * args.num_epochs)
    if args.max_steps is not None:
        max_steps = args.max_steps
    if is_main:
        print(f"[Dataset] {total_samples:,} samples  "
              f"eff_batch={effective_batch}  max_steps={max_steps:,}", flush=True)

    # ── Tokenizer ────────────────────────────────────────────────────────────
    tokenizer = AutoTokenizer.from_pretrained(args.model_id)
    tokenizer.pad_token = tokenizer.eos_token
    if not tokenizer.chat_template:
        with open(CHATML_TEMPLATE_PATH) as f:
            tokenizer.chat_template = f.read()
        if is_main:
            print(f"[Tokenizer] Loaded chat template from {CHATML_TEMPLATE_PATH}", flush=True)

    # ── Model ────────────────────────────────────────────────────────────────
    if args.no_fsdp:
        model = load_model_ddp(args.model_id)
        model.gradient_checkpointing_enable()
    else:
        model = load_model_fsdp(args.model_id, rank, all_ranks_load=all_ranks_load)

    # ── Training config ──────────────────────────────────────────────────────
    os.environ.setdefault("WANDB_MODE", "offline")

    train_kw = dict(
        output_dir=args.output_dir,
        max_steps=max_steps,
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
        max_length=args.max_seq_length,
        packing=False,
        assistant_only_loss=True,
        gradient_checkpointing=False,
        accelerator_config={"dispatch_batches": False, "split_batches": False},
    )

    if not args.no_fsdp:
        train_kw.update(make_fsdp_kwargs(
            all_ranks_load=all_ranks_load,
            transformer_layer_cls=args.fsdp_transformer_layer_cls,
        ))

    training_args = SFTConfig(**train_kw)

    if is_main:
        mode = "DDP" if args.no_fsdp else "FSDP2"
        print(f"[Config] {mode}  lr={args.lr}  batch={args.batch_size}  "
              f"grad_accum={args.grad_accum}  max_steps={max_steps}", flush=True)

    # ── Trainer (no formatting_func — SFTTrainer applies chat template
    #    internally and uses {% generation %} markers for loss masking) ────────
    trainer = SFTTrainer(
        model=model,
        args=training_args,
        train_dataset=dataset,
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
        print("Starting training...", flush=True)
    trainer.train(resume_from_checkpoint=checkpoint)
    if is_main:
        print("Training complete.", flush=True)


if __name__ == "__main__":
    main()
