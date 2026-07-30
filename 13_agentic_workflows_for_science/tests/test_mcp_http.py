from __future__ import annotations

import asyncio
import json
import os
import socket
import subprocess
import sys
from pathlib import Path

import pytest
from langchain_mcp_adapters.client import MultiServerMCPClient

ROOT = Path(__file__).resolve().parents[1]
WATER = ROOT / "data" / "structures" / "water.xyz"


def unused_local_port() -> int:
    try:
        with socket.socket() as sock:
            sock.bind(("127.0.0.1", 0))
            return int(sock.getsockname()[1])
    except PermissionError:
        pytest.skip("This environment does not permit localhost socket binding")


@pytest.mark.asyncio
async def test_streamable_http_discovery_and_call() -> None:
    port = unused_local_port()
    env = os.environ.copy()
    env["PYTHONPATH"] = str(ROOT / "src")
    process = subprocess.Popen(
        [
            sys.executable,
            str(ROOT / "examples" / "02_mcp_server.py"),
            "--port",
            str(port),
        ],
        cwd=ROOT,
        env=env,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    url = f"http://127.0.0.1:{port}/mcp"
    client = MultiServerMCPClient(
        {"mace": {"url": url, "transport": "http"}}
    )

    try:
        tools = None
        last_error: Exception | None = None
        for _ in range(40):
            if process.poll() is not None:
                break
            try:
                tools = await client.get_tools()
                break
            except Exception as exc:
                last_error = exc
                await asyncio.sleep(0.1)

        if tools is None:
            stdout, stderr = process.communicate(timeout=2)
            pytest.fail(
                f"MCP server did not start: {last_error}\nstdout={stdout}\nstderr={stderr}"
            )

        assert [tool.name for tool in tools] == ["run_mace"]
        result = await tools[0].ainvoke(
            {"structure_path": str(WATER), "backend": "emt"}
        )
        text = result[0]["text"] if isinstance(result, list) else result
        payload = json.loads(text)
        assert payload["status"] == "success"
        assert payload["backend"] == "emt"
    finally:
        process.terminate()
        try:
            process.wait(timeout=5)
        except subprocess.TimeoutExpired:
            process.kill()
            process.wait(timeout=5)
