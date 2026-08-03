#!/usr/bin/env python
"""Example 2 server: expose the MACE core over MCP Streamable HTTP."""

from __future__ import annotations

import argparse
from typing import Literal

from mcp.server.fastmcp import FastMCP

from atpesc_agentic.run_mace_core import run_mace_core


def build_server(host: str = "127.0.0.1", port: int = 8000) -> FastMCP:
    """Build the server so tests can inspect it without opening a port."""

    mcp = FastMCP(
        "ATPESC MACE",
        instructions="Run single-point atomic energies. Energies are in eV.",
        host=host,
        port=port,
        streamable_http_path="/mcp",
    )

    # The scientific body is unchanged; MCP only adds a transport and schema.
    @mcp.tool()
    def run_mace(
        structure_path: str,
        model: str = "small",
        device: Literal["cpu", "xpu"] = "cpu",
        backend: Literal["mace", "emt"] = "mace",
    ) -> dict:
        """Calculate a structure's single-point potential energy in eV.

        Use backend='mace' for scientific calculations. The explicit 'emt'
        backend exists only so the transport can be exercised without MACE.
        """

        return run_mace_core(
            structure_path=structure_path,
            model=model,
            device=device,
            backend=backend,
        ).model_dump()

    return mcp


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--host", default="127.0.0.1")
    parser.add_argument("--port", type=int, default=8000)
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    print(
        f"Starting MCP server at http://{args.host}:{args.port}/mcp "
        "(press Ctrl-C to stop)",
        flush=True,
    )
    build_server(args.host, args.port).run(transport="streamable-http")


if __name__ == "__main__":
    main()
