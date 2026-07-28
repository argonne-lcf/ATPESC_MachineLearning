#!/usr/bin/env python
"""Example 3 agent: ask an MCP server to run a Parsl MACE ensemble."""

from __future__ import annotations

import argparse
import asyncio
from pathlib import Path

from atpesc_agentic.agent_runner import discover_mcp_tools, run_agent_once

# --- ALCF inference endpoint (edit for the demo) ---
# The LLM that drives the agent. Set either to None to fall back to the
# ALCF_MODEL / ALCF_BASE_URL environment variables.
ALCF_MODEL = "openai/gpt-oss-120b"
ALCF_BASE_URL = "https://inference-api.alcf.anl.gov/resource_server/sophia/vllm/v1"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("structures", nargs="+")
    parser.add_argument("--server-url", default="http://127.0.0.1:8001/mcp")
    parser.add_argument("--mace-model", default="small")
    parser.add_argument("--device", choices=("cpu", "xpu"), default="cpu")
    parser.add_argument("--backend", choices=("mace", "emt"), default="mace")
    parser.add_argument("--prompt")
    return parser.parse_args()


async def run_agent(args: argparse.Namespace) -> None:
    structures = [
        str(Path(path).expanduser().resolve()) for path in args.structures
    ]
    tools = await discover_mcp_tools(
        args.server_url,
        "ensemble",
        start_hint="Start `python examples/03_ensemble_server.py` in another terminal.",
    )

    print("Discovered MCP tools:", ", ".join(tool.name for tool in tools))
    prompt = args.prompt or (
        f"Calculate the energies for these molecules: {structures}. "
        f"Use model={args.mace_model}, device={args.device}, and "
        f"backend={args.backend}. Summarize successes and failures in a table, "
        "with energies in eV and wall time in seconds."
    )
    await run_agent_once(
        tools=tools,
        system_prompt=(
            "You are an HPC scientific workflow agent. For multiple structures "
            "use run_mace_ensemble exactly once. Never invent missing results."
        ),
        user_prompt=prompt,
        llm_model=ALCF_MODEL,
        llm_base_url=ALCF_BASE_URL,
    )


def main() -> None:
    asyncio.run(run_agent(parse_args()))


if __name__ == "__main__":
    main()
