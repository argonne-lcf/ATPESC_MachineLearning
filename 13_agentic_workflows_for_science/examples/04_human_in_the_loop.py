#!/usr/bin/env python
"""Example 4: pause a LangGraph MACE agent for durable human approval."""

from __future__ import annotations

import argparse
import asyncio
from pathlib import Path
from typing import Literal

from langchain_core.tools import tool
from langgraph.types import Command, interrupt

from atpesc_agentic.agent_graph import build_agent_graph
from atpesc_agentic.alcf_llm import build_alcf_llm, print_agent_messages
from atpesc_agentic.run_mace_core import run_mace_core

# --- ALCF inference endpoint (edit for the demo) ---
# The LLM that drives the agent. Set either to None to fall back to the
# ALCF_MODEL / ALCF_BASE_URL environment variables.
ALCF_MODEL = "openai/gpt-oss-120b"
ALCF_BASE_URL = "https://inference-api.alcf.anl.gov/resource_server/sophia/vllm/v1"


@tool
def run_mace(
    structure_path: str,
    model: str = "small",
    device: Literal["cpu", "xpu"] = "cpu",
    backend: Literal["mace", "emt"] = "mace",
) -> dict:
    """Calculate a structure's single-point potential energy in eV."""

    return run_mace_core(
        structure_path=structure_path,
        model=model,
        device=device,
        backend=backend,
    ).model_dump()


@tool
def ask_human(question: str, proposed_action: str) -> str:
    """Pause and ask a human to approve or revise a scientific action.

    Call this before run_mace. Include the structure, model, device, and backend
    in proposed_action. The graph persists here until a human resumes it.
    """

    answer = interrupt(
        {
            "question": question,
            "proposed_action": proposed_action,
        }
    )
    return f"Human response: {answer}"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--structure")
    parser.add_argument("--mace-model", default="small")
    parser.add_argument("--device", choices=("cpu", "xpu"), default="cpu")
    parser.add_argument("--backend", choices=("mace", "emt"), default="mace")
    parser.add_argument("--checkpoint-db", default="runs/hitl.sqlite")
    parser.add_argument("--thread-id", default="atpesc-demo")
    parser.add_argument(
        "--resume",
        help="Resume a persisted interrupt directly, e.g. --resume approved",
    )
    parser.add_argument(
        "--leave-pending",
        action="store_true",
        help="Exit at the first interrupt so restart recovery can be demonstrated",
    )
    parser.add_argument("--prompt")
    return parser.parse_args()


def _interrupt_value(result: dict) -> dict | None:
    # "__interrupt__" is LangGraph's reserved state key: when a node calls
    # interrupt(), the graph pauses and exposes the pending value(s) here.
    pending = result.get("__interrupt__", ())
    if not pending:
        return None
    value = pending[0].value
    return value if isinstance(value, dict) else {"question": str(value)}


async def run_workflow(args: argparse.Namespace) -> None:
    try:
        from langgraph.checkpoint.sqlite.aio import AsyncSqliteSaver
    except ImportError as exc:
        raise RuntimeError(
            "SQLite checkpoint support is not installed. Run `./install.sh` to "
            "build the full environment."
        ) from exc

    database = Path(args.checkpoint_db).expanduser().resolve()
    database.parent.mkdir(parents=True, exist_ok=True)
    config = {"configurable": {"thread_id": args.thread_id}}

    async with AsyncSqliteSaver.from_conn_string(str(database)) as checkpointer:
        agent = build_agent_graph(
            model=build_alcf_llm(model=ALCF_MODEL, base_url=ALCF_BASE_URL),
            tools=[run_mace, ask_human],
            checkpointer=checkpointer,
            system_prompt=(
                "You are a cautious scientific workflow agent. Before every "
                "run_mace call, call ask_human exactly once with all proposed "
                "parameters. If the human denies the action, do not run it. If "
                "they revise parameters, use the revisions. Never invent an "
                "energy."
            ),
        )

        if args.resume is not None:
            # Command(resume=...) feeds the human's answer back into the paused
            # interrupt() call and continues the graph from the saved checkpoint.
            result = await agent.ainvoke(Command(resume=args.resume), config=config)
        else:
            if not args.structure:
                raise ValueError("--structure is required unless --resume is used.")
            structure = str(Path(args.structure).expanduser().resolve())
            prompt = args.prompt or (
                f"Calculate the energy of {structure} using model="
                f"{args.mace_model}, device={args.device}, backend={args.backend}."
            )
            result = await agent.ainvoke(
                {"messages": [{"role": "user", "content": prompt}]},
                config=config,
            )

        while (pending := _interrupt_value(result)) is not None:
            print("\nWorkflow interrupted and saved to SQLite.")
            print(f"Question: {pending.get('question')}")
            print(f"Proposed action: {pending.get('proposed_action', 'n/a')}")
            if args.leave_pending:
                print(
                    "Resume later with:\n"
                    f"python examples/04_human_in_the_loop.py "
                    f"--checkpoint-db {database} --thread-id {args.thread_id} "
                    "--resume approved"
                )
                return
            answer = input("Approve, deny, or revise: ").strip()
            result = await agent.ainvoke(Command(resume=answer), config=config)

        print_agent_messages(result)
        print(f"\nCheckpoint database: {database}")
        print(f"Thread id: {args.thread_id}")


def main() -> None:
    asyncio.run(run_workflow(parse_args()))


if __name__ == "__main__":
    main()
