#!/usr/bin/env python3
"""Generate solvable Countdown-style GRPO training data.

Every sample is guaranteed to have an exact solution: the target is produced
by evaluating a randomly constructed arithmetic expression over the sampled
numbers.

Output format (one JSON object per line):
  {"prompt": [{"role": "user", "content": "..."}],
   "target": 532, "numbers": [100, 75, 50, 25, 6, 3],
   "solution": "(100 + 75) * 3 + 6 - 25 + ..."}
"""

import argparse
import json
import random
from pathlib import Path

OPS = ["+", "-", "*"]


def make_prompt(target: int, numbers: list[int]) -> list[dict]:
    content = (
        f"Using the numbers {numbers}, create an equation that equals {target}. "
        "You can use basic arithmetic operations (+, -, *) and each number can only be used once. "
        "Show your work in <think> </think> tags. And return the final answer in "
        "<answer> </answer> tags, for example <answer> (1 + 2) * 3 </answer>."
    )
    return [{"role": "user", "content": content}]


def combine(a_val, a_expr, b_val, b_expr, op):
    if op == "+":
        return a_val + b_val, f"({a_expr} + {b_expr})"
    if op == "-":
        return a_val - b_val, f"({a_expr} - {b_expr})"
    if op == "*":
        return a_val * b_val, f"({a_expr} * {b_expr})"
    raise ValueError(f"Unsupported op: {op}")


def build_instance(n_numbers, min_number, max_number, min_target, max_target,
                   max_attempts=1000):
    for _ in range(max_attempts):
        numbers = [random.randint(min_number, max_number) for _ in range(n_numbers)]
        working = [(v, str(v)) for v in numbers]
        while len(working) > 1:
            i, j = sorted(random.sample(range(len(working)), 2), reverse=True)
            left, right = working.pop(i), working.pop(j)
            if random.random() < 0.5:
                a, b = left, right
            else:
                a, b = right, left
            op = random.choice(OPS)
            value, expr = combine(a[0], a[1], b[0], b[1], op)
            working.append((value, expr))
        target, solution = working[0]
        if min_target <= target <= max_target:
            return {
                "prompt": make_prompt(target, numbers),
                "target": target,
                "numbers": numbers,
                "solution": solution,
            }
    raise RuntimeError(f"Failed after {max_attempts} attempts")


def main():
    p = argparse.ArgumentParser(description="Generate solvable countdown dataset")
    p.add_argument("--output", default="/lus/flare/projects/ATPESC2026/LLM_post-training/data/countdown_train.jsonl")
    p.add_argument("--num_samples", type=int, default=5000)
    p.add_argument("--min_numbers", type=int, default=3)
    p.add_argument("--max_numbers", type=int, default=5)
    p.add_argument("--min_number", type=int, default=1)
    p.add_argument("--max_number", type=int, default=20)
    p.add_argument("--min_target", type=int, default=1)
    p.add_argument("--max_target", type=int, default=999)
    p.add_argument("--seed", type=int, default=42)
    args = p.parse_args()

    random.seed(args.seed)
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with output_path.open("w") as f:
        for _ in range(args.num_samples):
            row = build_instance(
                n_numbers=random.randint(args.min_numbers, args.max_numbers),
                min_number=args.min_number, max_number=args.max_number,
                min_target=args.min_target, max_target=args.max_target,
            )
            f.write(json.dumps(row) + "\n")

    print(f"Wrote {args.num_samples} samples to {output_path}")


if __name__ == "__main__":
    main()
