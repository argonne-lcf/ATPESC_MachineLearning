#!/usr/bin/env python3
"""Test a model on Countdown puzzles — compare base vs. GRPO-trained."""

from transformers import AutoModelForCausalLM, AutoTokenizer
import argparse
import os
import torch


COUNTDOWN_PROMPTS = [
    {"target": 42, "numbers": [10, 5, 3, 2]},
    {"target": 100, "numbers": [20, 15, 5, 4]},
    {"target": 73, "numbers": [8, 9, 1, 7]},
    {"target": 256, "numbers": [16, 12, 8, 4, 2]},
    {"target": 15, "numbers": [7, 3, 5]},
]


def make_prompt(target, numbers):
    content = (
        f"Using the numbers {list(numbers)}, create an equation that equals {target}. "
        "You can use basic arithmetic operations (+, -, *) and each number can only be used once. "
        "Show your work in <think> </think> tags. And return the final answer in "
        "<answer> </answer> tags, for example <answer> (1 + 2) * 3 </answer>."
    )
    return [{"role": "user", "content": content}]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--raw", action="store_true",
                        help="Pass prompts as raw text (no chat template). "
                             "Use for base models.")
    parser.add_argument("--interactive", action="store_true",
                        help="Enter interactive prompt after running test puzzles.")
    args = parser.parse_args()

    MODEL_PATH = os.getenv("MODEL_PATH", "SmolLM2-1.7B")
    device = "xpu" if hasattr(torch, "xpu") and torch.xpu.is_available() else "cpu"
    tokenizer = AutoTokenizer.from_pretrained(MODEL_PATH)
    model = AutoModelForCausalLM.from_pretrained(MODEL_PATH).to(device)

    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token

    mode = "raw text" if args.raw else "chat template"
    print(f"Model: {MODEL_PATH}")
    print(f"Mode: {mode}  Device: {device}")
    print()

    for i, puzzle in enumerate(COUNTDOWN_PROMPTS):
        target, numbers = puzzle["target"], puzzle["numbers"]
        messages = make_prompt(target, numbers)

        if args.raw:
            chat_input = messages[0]["content"]
        else:
            chat_input = tokenizer.apply_chat_template(
                messages, tokenize=False, add_generation_prompt=True
            )

        inputs = tokenizer(chat_input, return_tensors="pt").to(model.device)
        output_ids = model.generate(
            **inputs, max_new_tokens=256, do_sample=True,
            temperature=0.8, top_p=0.95,
        )
        generated = tokenizer.decode(
            output_ids[0][inputs.input_ids.shape[1]:],
            skip_special_tokens=True,
        ).strip()

        print(f"--- Puzzle {i} ---")
        print(f"Target: {target}  Numbers: {numbers}")
        print(f"Output: {generated}")
        print()


    if not args.interactive:
        return

    print("\nInteractive mode (Ctrl-C to exit)")
    print("Enter target and numbers, e.g.: 42 10 5 3 2")
    try:
        while True:
            user_input = input("\n> ").strip()
            if not user_input:
                continue
            parts = user_input.split()
            target = int(parts[0])
            numbers = [int(x) for x in parts[1:]]
            messages = make_prompt(target, numbers)
            if args.raw:
                chat_input = messages[0]["content"]
            else:
                chat_input = tokenizer.apply_chat_template(
                    messages, tokenize=False, add_generation_prompt=True
                )
            inputs = tokenizer(chat_input, return_tensors="pt").to(model.device)
            output_ids = model.generate(
                **inputs, max_new_tokens=256, do_sample=True,
                temperature=0.8, top_p=0.95,
            )
            generated = tokenizer.decode(
                output_ids[0][inputs.input_ids.shape[1]:],
                skip_special_tokens=True,
            ).strip()
            print(generated)
    except (KeyboardInterrupt, EOFError):
        print("\nBye!")


if __name__ == "__main__":
    main()
