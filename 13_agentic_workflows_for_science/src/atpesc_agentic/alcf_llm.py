"""Configuration helpers for the OpenAI-compatible ALCF inference service.

The ALCF inference endpoints authenticate with a Globus-issued access token. The
bundled ``scripts/inference_auth_token.py`` (copied from
https://github.com/argonne-lcf/inference-endpoints) wraps the Globus login flow
and can mint / auto-refresh that token.

Token resolution order used by :func:`build_alcf_llm`:

1. ``ALCF_ACCESS_TOKEN`` environment variable, if set (manual override / a token
   already exported into the shell).
2. Otherwise, call ``inference_auth_token.get_access_token()`` which reuses a
   cached Globus token, refreshing it when expired, and triggers an interactive
   login on first use.

See https://docs.alcf.anl.gov/services/inference-endpoints/#web-ui for details.
"""

from __future__ import annotations

import os
import sys
from pathlib import Path

from langchain_openai import ChatOpenAI

DEFAULT_ALCF_BASE_URL = (
    "https://inference-api.alcf.anl.gov/resource_server/sophia/vllm/v1"
)

# Model shown working against the Sophia vLLM endpoint in ALCF's demo notebook.
DEFAULT_ALCF_MODEL = "openai/gpt-oss-120b"

# Location of the bundled Globus token helper (repo_root/scripts).
_SCRIPTS_DIR = Path(__file__).resolve().parents[2] / "scripts"


def _fetch_token_via_globus() -> str:
    """Return an access token from the bundled Globus helper script.

    Raises RuntimeError with actionable guidance if the helper cannot be
    imported (e.g. ``globus-sdk`` not installed) or fails to produce a token.
    """

    if str(_SCRIPTS_DIR) not in sys.path:
        sys.path.insert(0, str(_SCRIPTS_DIR))

    try:
        from inference_auth_token import get_access_token  # type: ignore
    except Exception as exc:  # pragma: no cover - import/env dependent
        raise RuntimeError(
            "Could not import the ALCF Globus token helper from "
            f"{_SCRIPTS_DIR / 'inference_auth_token.py'}. Install the token "
            "dependency with `pip install globus-sdk` (included in this "
            "project's dependencies), or export ALCF_ACCESS_TOKEN manually. "
            "First-time use requires an interactive Globus login: run "
            "`python scripts/inference_auth_token.py authenticate`."
        ) from exc

    try:
        return get_access_token()
    except Exception as exc:  # pragma: no cover - network/auth dependent
        raise RuntimeError(
            "Failed to obtain an ALCF access token via Globus. Run "
            "`python scripts/inference_auth_token.py authenticate` to log in, "
            "or export ALCF_ACCESS_TOKEN manually. See "
            "https://docs.alcf.anl.gov/services/inference-endpoints/#web-ui"
        ) from exc


def build_alcf_llm(
    *,
    model: str | None = None,
    base_url: str | None = None,
    temperature: float = 0.0,
) -> ChatOpenAI:
    """Build a LangChain chat model for the ALCF inference service.

    ``model`` and ``base_url`` may be passed explicitly (e.g. from a constant at
    the top of an example script). When omitted they fall back to the
    ``ALCF_MODEL`` / ``ALCF_BASE_URL`` environment variables, then to the module
    defaults.
    """

    token = os.getenv("ALCF_ACCESS_TOKEN")
    if not token or token.startswith("REPLACE_"):
        # Fall back to the Globus flow (cached token, auto-refresh, or login).
        token = _fetch_token_via_globus()
    model = model or os.getenv("ALCF_MODEL", DEFAULT_ALCF_MODEL)
    base_url = base_url or os.getenv("ALCF_BASE_URL", DEFAULT_ALCF_BASE_URL)

    return ChatOpenAI(
        model=model,
        base_url=base_url,
        api_key=token,
        temperature=temperature,
        max_retries=2,
        timeout=120,
    )


def print_agent_messages(result: dict) -> None:
    """Print a LangGraph agent trace without depending on a notebook renderer."""

    for message in result.get("messages", []):
        pretty_print = getattr(message, "pretty_print", None)
        if callable(pretty_print):
            pretty_print()
        else:
            print(message)
