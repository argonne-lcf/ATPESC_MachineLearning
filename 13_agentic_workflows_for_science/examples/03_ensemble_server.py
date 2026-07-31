#!/usr/bin/env python
"""Example 3 server: expose single and Parsl-ensemble MACE tools over MCP."""

from __future__ import annotations

import argparse
from typing import Literal

from mcp.server.fastmcp import FastMCP

from atpesc_agentic.run_mace_core import run_mace_core
from atpesc_agentic.run_mace_ensemble_core import run_mace_ensemble_core


def build_server(
    *,
    host: str = "127.0.0.1",
    port: int = 8001,
    run_dir: str = "runs/parsl",
    max_workers: int | None = None,
) -> FastMCP:
    mcp = FastMCP(
        "ATPESC MACE Ensemble",
        instructions=(
            "Run single or ensemble atomic energies. Use the ensemble tool for "
            "two or more structures. Energies are in eV."
        ),
        host=host,
        port=port,
        streamable_http_path="/mcp",
    )

    @mcp.tool()
    def run_mace(
        structure_path: str,
        model: str = "small",
        device: Literal["cpu", "xpu"] = "cpu",
        backend: Literal["mace", "emt"] = "mace",
    ) -> dict:
        """Calculate one structure's single-point potential energy in eV."""

        return run_mace_core(
            structure_path=structure_path,
            model=model,
            device=device,
            backend=backend,
        ).model_dump()

    # Parsl is an implementation detail behind the same MCP tool interface.
    @mcp.tool()
    def run_mace_ensemble(
        structure_paths: list[str],
        model: str = "small",
        device: Literal["cpu", "xpu"] = "xpu",
        backend: Literal["mace", "emt"] = "mace",
    ) -> dict:
        """Calculate multiple structure energies concurrently with Parsl on Aurora.

        Use this tool for two or more ASE-readable structure files. Each entry in
        ``structure_paths`` may be a structure file or a directory that is
        searched recursively for structure files. Results preserve
        input-independent failures and report energies in eV.
        """

        return run_mace_ensemble_core(
            structure_paths=structure_paths,
            model=model,
            device=device,
            backend=backend,
            run_dir=run_dir,
            max_workers=max_workers,
        ).model_dump()

    return mcp


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--host", default="127.0.0.1")
    parser.add_argument("--port", type=int, default=8001)
    parser.add_argument("--run-dir", default="runs/parsl")
    parser.add_argument("--max-workers", type=int)
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    print(
        f"Starting Aurora ensemble MCP server at "
        f"http://{args.host}:{args.port}/mcp (press Ctrl-C to stop)",
        flush=True,
    )
    build_server(
        host=args.host,
        port=args.port,
        run_dir=args.run_dir,
        max_workers=args.max_workers,
    ).run(transport="streamable-http")


if __name__ == "__main__":
    main()
