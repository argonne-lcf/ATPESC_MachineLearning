#!/usr/bin/env python
"""Example 1: expose the plain MACE core as a LangGraph agent tool."""

from __future__ import annotations

import argparse
import asyncio
from pathlib import Path
from typing import Literal

from langchain_core.tools import tool

from atpesc_agentic.agent_runner import run_agent_once
from atpesc_agentic.run_mace_core import run_mace_core

# --- ALCF inference endpoint (edit for the demo) ---
# The LLM that drives the agent. Set either to None to fall back to the
# ALCF_MODEL / ALCF_BASE_URL environment variables.
ALCF_MODEL = "openai/gpt-oss-120b"
ALCF_BASE_URL = "https://inference-api.alcf.anl.gov/resource_server/sophia/vllm/v1"


# This decorator is the only agent-specific layer around the scientific core.
@tool
def run_mace(
    structure_path: str,
    model: str = "small",
    device: Literal["cpu", "xpu"] = "cpu",
    backend: Literal["mace", "emt"] = "mace",
) -> dict:
    """Calculate the single-point potential energy of a structure.

    Use this tool when a user asks for an energy from an atomic structure file.
    Energies are returned in electron volts. Use backend='mace' for scientific
    calculations; backend='emt' is only an explicit lightweight tutorial mode.
    """

    return run_mace_core(
        structure_path=structure_path,
        model=model,
        device=device,
        backend=backend,
    ).model_dump()


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--structure", required=True, help="ASE-readable structure file")
    parser.add_argument("--mace-model", default="small")
    parser.add_argument("--device", choices=("cpu", "xpu"), default="cpu")
    parser.add_argument("--backend", choices=("mace", "emt"), default="mace")
    parser.add_argument("--prompt", help="Override the demonstration user prompt")
    return parser.parse_args()


async def run_example(args: argparse.Namespace) -> None:
    structure = str(Path(args.structure).expanduser().resolve())
    prompt = args.prompt or (
        f"Use the energy tool to calculate {structure}. "
        f"Use model={args.mace_model}, device={args.device}, "
        f"and backend={args.backend}. Report the energy in eV and identify "
        "which backend produced it."
    )

    print("LangGraph tool schema:")
    print(run_mace.args_schema.model_json_schema())

    await run_agent_once(
        tools=[run_mace],
        system_prompt=(
            "You are a scientific workflow agent. Use the run_mace tool for "
            "energy calculations; never invent energies. Report tool failures "
            "verbatim and distinguish the EMT teaching fallback from MACE."
        ),
        user_prompt=prompt,
        llm_model=ALCF_MODEL,
        llm_base_url=ALCF_BASE_URL,
    )


def main() -> None:
    asyncio.run(run_example(parse_args()))


if __name__ == "__main__":
    main()
