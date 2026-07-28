from __future__ import annotations

from pathlib import Path
from typing import TypedDict

import pytest

from atpesc_agentic.run_mace_ensemble_core import (
    _expand_structure_paths,
    run_mace_ensemble_core,
    shutdown_parsl,
)

ROOT = Path(__file__).resolve().parents[1]
STRUCTURES = ROOT / "data" / "structures"


def test_expand_structure_paths_directory_and_dedup(tmp_path: Path) -> None:
    expected = sorted(
        (path.resolve() for path in STRUCTURES.glob("*.xyz")),
        key=str,
    )

    # A directory expands to its structure files.
    assert _expand_structure_paths([str(STRUCTURES)]) == expected

    # Mixing a directory with an explicit file de-duplicates.
    mixed = _expand_structure_paths(
        [str(STRUCTURES / "water.xyz"), str(STRUCTURES)]
    )
    assert mixed == expected

    # Non-structure files inside a directory are ignored.
    (tmp_path / "README.txt").write_text("not a structure")
    (tmp_path / "note.md").write_text("also not a structure")
    assert _expand_structure_paths([str(tmp_path)]) == []


def test_run_mace_ensemble_accepts_directory(tmp_path: Path) -> None:
    pytest.importorskip("parsl")

    try:
        result = run_mace_ensemble_core(
            [str(STRUCTURES)],
            backend="emt",
            execution_target="local",
            run_dir=str(tmp_path / "parsl"),
            max_workers=2,
        )
    finally:
        shutdown_parsl()

    assert result.status == "success"
    assert result.total == 3
    assert result.succeeded == 3
    assert [item.structure_path for item in result.results] == sorted(
        str(path.resolve()) for path in STRUCTURES.glob("*.xyz")
    )


def test_local_parsl_ensemble_and_partial_failure(tmp_path: Path) -> None:
    pytest.importorskip("parsl")
    inputs = [
        str(STRUCTURES / "water.xyz"),
        str(tmp_path / "missing.xyz"),
        str(STRUCTURES / "methane.xyz"),
    ]

    try:
        result = run_mace_ensemble_core(
            inputs,
            backend="emt",
            execution_target="local",
            run_dir=str(tmp_path / "parsl"),
            max_workers=2,
        )
    finally:
        shutdown_parsl()

    assert result.status == "partial_failure"
    assert result.total == 3
    assert result.succeeded == 2
    assert result.failed == 1
    assert [item.structure_path for item in result.results] == sorted(
        str(Path(path).resolve()) for path in inputs
    )


@pytest.mark.asyncio
async def test_sqlite_interrupt_survives_recompile(tmp_path: Path) -> None:
    pytest.importorskip("aiosqlite")
    sqlite_module = pytest.importorskip("langgraph.checkpoint.sqlite.aio")

    from langgraph.graph import END, START, StateGraph
    from langgraph.types import Command, interrupt

    class State(TypedDict, total=False):
        answer: str

    def approval_node(_: State) -> State:
        return {"answer": interrupt({"question": "Approve?"})}

    database = tmp_path / "checkpoint.sqlite"
    config = {"configurable": {"thread_id": "restart-test"}}

    async with sqlite_module.AsyncSqliteSaver.from_conn_string(
        str(database)
    ) as saver:
        builder = StateGraph(State)
        builder.add_node("approval", approval_node)
        builder.add_edge(START, "approval")
        builder.add_edge("approval", END)
        graph = builder.compile(checkpointer=saver)
        first = await graph.ainvoke({}, config=config)
        assert first["__interrupt__"][0].value == {"question": "Approve?"}

    # A new saver and graph simulate restarting the Python program.
    async with sqlite_module.AsyncSqliteSaver.from_conn_string(
        str(database)
    ) as saver:
        builder = StateGraph(State)
        builder.add_node("approval", approval_node)
        builder.add_edge(START, "approval")
        builder.add_edge("approval", END)
        graph = builder.compile(checkpointer=saver)
        resumed = await graph.ainvoke(Command(resume="approved"), config=config)

    assert resumed["answer"] == "approved"
