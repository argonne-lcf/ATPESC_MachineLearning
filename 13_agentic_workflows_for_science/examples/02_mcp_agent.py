#!/usr/bin/env python
"""Example 2 agent: discover and call the remote Streamable HTTP MCP tool."""

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
    parser.add_argument("--server-url", default="http://127.0.0.1:8000/mcp")
    parser.add_argument("--structure", required=True)
    parser.add_argument("--mace-model", default="small")
    parser.add_argument("--device", choices=("cpu", "xpu"), default="cpu")
    parser.add_argument("--backend", choices=("mace", "emt"), default="mace")
    parser.add_argument("--prompt")
    return parser.parse_args()


async def run_agent(args: argparse.Namespace) -> None:
    structure = str(Path(args.structure).expanduser().resolve())
    tools = await discover_mcp_tools(
        args.server_url,
        "mace",
        start_hint="Start `python examples/02_mcp_server.py` in another terminal.",
    )

    print("Discovered MCP tools:")
    for discovered_tool in tools:
        print(f"- {discovered_tool.name}: {discovered_tool.description}")
        # MCP-discovered tools expose args_schema as a plain JSON-schema dict
        # (langchain-mcp-adapters sets args_schema=tool.inputSchema), whereas a
        # local @tool exposes a Pydantic model. Support both.
        schema = discovered_tool.args_schema
        if hasattr(schema, "model_json_schema"):
            schema = schema.model_json_schema()
        print(f"  schema={schema}")

    prompt = args.prompt or (
        f"Calculate the energy of {structure} with model={args.mace_model}, "
        f"device={args.device}, and backend={args.backend}. You must use the "
        "remote tool and report its energy in eV."
    )
    await run_agent_once(
        tools=tools,
        system_prompt=(
            "You are a scientific workflow agent. Use the MCP tool for every "
            "energy calculation and never make up a numerical result."
        ),
        user_prompt=prompt,
        llm_model=ALCF_MODEL,
        llm_base_url=ALCF_BASE_URL,
    )


def main() -> None:
    asyncio.run(run_agent(parse_args()))


if __name__ == "__main__":
    main()
