from __future__ import annotations

import asyncio
import importlib.util
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
WATER = ROOT / "data" / "structures" / "water.xyz"


def load_example(filename: str):
    path = ROOT / "examples" / filename
    spec = importlib.util.spec_from_file_location(filename.removesuffix(".py"), path)
    assert spec and spec.loader
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def test_direct_langgraph_decorator_calls_core() -> None:
    example = load_example("01_langgraph_mace.py")
    result = example.run_mace.invoke(
        {"structure_path": str(WATER), "backend": "emt"}
    )

    assert result["status"] == "success"
    assert result["backend"] == "emt"
    assert "energy_ev" in result


def test_mcp_decorator_exposes_schema_and_calls_core() -> None:
    example = load_example("02_mcp_server.py")

    async def exercise() -> None:
        server = example.build_server()
        tools = await server.list_tools()
        assert [tool.name for tool in tools] == ["run_mace"]
        assert tools[0].inputSchema["properties"]["device"]["enum"] == [
            "cpu",
            "xpu",
        ]

        content = await server.call_tool(
            "run_mace",
            {"structure_path": str(WATER), "backend": "emt"},
        )
        payload = json.loads(content[0].text)
        assert payload["status"] == "success"
        assert payload["backend"] == "emt"

    asyncio.run(exercise())


def test_ensemble_server_exposes_single_and_ensemble_tools() -> None:
    example = load_example("03_ensemble_server.py")

    async def exercise() -> None:
        tools = await example.build_server().list_tools()
        assert [tool.name for tool in tools] == [
            "run_mace",
            "run_mace_ensemble",
        ]

    asyncio.run(exercise())


def test_hitl_example_keeps_both_decorators_visible() -> None:
    example = load_example("04_human_in_the_loop.py")

    assert example.run_mace.name == "run_mace"
    assert example.ask_human.name == "ask_human"
    schema = example.ask_human.args_schema.model_json_schema()
    assert schema["required"] == ["question", "proposed_action"]
