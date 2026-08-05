from __future__ import annotations

import logging
from collections import Counter

logger = logging.getLogger(__name__)

TARGET_WORD = 'piano'


def wordle_feedback(guess: str) -> list[str] | str:
    """Return per-letter Wordle feedback for a guess against a target.

    Each position in the returned list contains one of three values:
    - "correct":  letter is in the correct position (green)
    - "present":  letter is in the target but in the wrong position (yellow)
    - "absent":   letter is not in the target (grey)

    Duplicate letters are handled consistently with standard Wordle rules:
    correct-position matches are allocated first, then remaining target letters
    are matched left-to-right for "present" results.

    Args:
        guess: The guessed word (must be same length as target).
        target: The hidden target word.

    Returns:
        A list of feedback strings, one per letter in guess.

    Raises:
        ValueError: If guess and target have different lengths.
    """
    guess = guess.lower()
    logger.info(f'Evaluating wordle guess: {guess}')

    if len(guess) != len(TARGET_WORD):
        return f'Guess must be {len(TARGET_WORD)} characters, got {len(guess)}'

    result = ['absent'] * len(guess)
    remaining: Counter[str] = Counter()

    # First pass: mark correct positions, track remaining target letters.
    for i, (g, t) in enumerate(zip(guess, TARGET_WORD)):
        if g == t:
            result[i] = 'correct'
        else:
            remaining[t] += 1

    # Second pass: mark present letters using remaining quota.
    for i, g in enumerate(guess):
        if result[i] == 'absent' and remaining[g] > 0:
            result[i] = 'present'
            remaining[g] -= 1

    return result