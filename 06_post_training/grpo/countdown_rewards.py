"""Reward function for Countdown-game GRPO training.

Single reward function matching TinyZero's scoring:
  0.0  — no <answer> tags found
  0.1  — valid format but wrong answer or wrong numbers
  1.0  — correct answer using exactly the provided numbers
"""

import re
import random


def extract_answer(text: str) -> str:
    if isinstance(text, list) and text:
        last = text[-1]
        if isinstance(last, dict):
            text = last.get("content", "")
    if not isinstance(text, str):
        return ""
    matches = list(re.finditer(r"<answer>(.*?)</answer>", text, re.IGNORECASE | re.DOTALL))
    if matches:
        return matches[-1].group(1).strip()
    return ""


def validate_equation(equation_str, available_numbers):
    try:
        numbers_in_eq = sorted(int(n) for n in re.findall(r"\d+", equation_str))
        available_sorted = sorted(available_numbers)
        return numbers_in_eq == available_sorted
    except Exception:
        return False


def evaluate_equation(equation_str):
    try:
        if not re.match(r'^[\d+\-*/().\s]+$', equation_str):
            return None
        result = eval(equation_str, {"__builtins__": None}, {})
        return result
    except Exception:
        return None


def countdown_reward(completions, target, numbers, **kwargs):
    """Single reward function for countdown task (TinyZero-style).

    Returns 0.0, 0.1, or 1.0 per completion.
    """
    FORMAT_SCORE = 0.1
    CORRECT_SCORE = 1.0

    rewards = []
    for completion, tgt, nums in zip(completions, target, numbers, strict=False):
        equation = extract_answer(completion)
        do_print = random.randint(1, 64) == 1

        if do_print:
            print(f"Target: {tgt} | Numbers: {nums} | Equation: {equation}")

        if not equation:
            rewards.append(0.0)
            continue

        if not validate_equation(equation, nums):
            if do_print:
                print(f"  -> Invalid numbers usage")
            rewards.append(FORMAT_SCORE)
            continue

        result = evaluate_equation(equation)
        if result is None:
            if do_print:
                print(f"  -> Could not evaluate")
            rewards.append(FORMAT_SCORE)
            continue

        if abs(result - tgt) < 1e-5:
            if do_print:
                print(f"  -> Correct! {equation} = {result}")
            rewards.append(CORRECT_SCORE)
        else:
            if do_print:
                print(f"  -> Wrong: {equation} = {result}, target = {tgt}")
            rewards.append(FORMAT_SCORE)

    return rewards
