#!/usr/bin/env python
"""Preflight check for ATPESC module 08 — run this first to confirm your setup.

Prints a pass/fail line for each requirement so you know which examples you can
run before the live demo:

    python scripts/check_setup.py

It checks the Python version, that the package is importable, whether an ALCF
inference token can be obtained (needed by every example's LLM), and which
optional extras (MACE, Parsl, SQLite) are installed.
"""

from __future__ import annotations

import importlib.util
import sys

OK = "[ ok ]"
NO = "[fail]"
NA = "[ -- ]"


def _has(module: str) -> bool:
    return importlib.util.find_spec(module) is not None


def main() -> int:
    ok = True

    # Python >= 3.11 (declared in pyproject.toml).
    py_ok = sys.version_info >= (3, 11)
    print(f"{OK if py_ok else NO} Python {sys.version_info.major}.{sys.version_info.minor} "
          f"(need >= 3.11)")
    ok = ok and py_ok

    # The teaching package itself.
    pkg_ok = _has("atpesc_agentic")
    print(f"{OK if pkg_ok else NO} atpesc_agentic importable"
          f"{'' if pkg_ok else '  -> run ./install.sh'}")
    ok = ok and pkg_ok

    # ALCF token: every example drives an LLM, so this is the usual demo-day trip.
    # A local token can still be rejected by the server (expired/invalid), so we
    # send one tiny live request to confirm the endpoint actually accepts it.
    if pkg_ok:
        try:
            from atpesc_agentic.alcf_llm import build_alcf_llm

            llm = build_alcf_llm()  # resolves the Globus/ALCF token or raises
            llm.invoke("ping")      # one cheap call; raises 401 on a bad token
            print(f"{OK} ALCF inference endpoint reachable and token accepted")
        except Exception as exc:  # noqa: BLE001 - report any failure to the student
            ok = False
            print(f"{NO} ALCF inference call failed: {exc}")
            print("       -> python scripts/inference_auth_token.py authenticate")
    else:
        print(f"{NA} ALCF inference token (skipped: package not importable)")

    # The single install (./install.sh) provides these; report each so a broken
    # environment is obvious. MACE is the XPU fork installed by install.sh; the
    # others come from `pip install -e .`.
    components = {
        "mace": "MACE (Examples 1-4 with --backend mace)",
        "parsl": "Parsl (Example 3 ensemble)",
        "aiosqlite": "SQLite checkpoints (Example 4 human-in-the-loop)",
    }
    print("Environment components:")
    for module, what in components.items():
        present = _has(module)
        ok = ok and present
        print(f"  {OK if present else NO} {module:10s} -> {what}"
              f"{'' if present else '   run ./install.sh'}")

    print()
    print("Setup looks good." if ok
          else "Setup incomplete — address the [fail] lines above.")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
