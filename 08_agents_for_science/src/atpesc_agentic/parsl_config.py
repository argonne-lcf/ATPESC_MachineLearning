"""Local and Aurora Parsl configurations for the ensemble example."""

from __future__ import annotations

import os
from pathlib import Path
from typing import Literal

ExecutionTarget = Literal["local", "aurora"]


def _pbs_node_count() -> int:
    node_file = os.getenv("PBS_NODEFILE")
    if not node_file:
        raise RuntimeError(
            "PBS_NODEFILE is not set. Start the Aurora server inside an active "
            "PBS allocation."
        )

    path = Path(node_file)
    if not path.is_file():
        raise RuntimeError(f"PBS_NODEFILE does not exist: {path}")

    hosts = {line.strip() for line in path.read_text().splitlines() if line.strip()}
    if not hosts:
        raise RuntimeError(f"PBS_NODEFILE contains no worker hosts: {path}")
    return len(hosts)


def build_parsl_config(
    execution_target: ExecutionTarget,
    *,
    run_dir: str | Path,
    max_workers: int | None = None,
):
    """Create a Parsl configuration without importing Parsl at module import."""

    try:
        from parsl.addresses import address_by_interface
        from parsl.config import Config
        from parsl.executors import HighThroughputExecutor
        from parsl.launchers import MpiExecLauncher
        from parsl.providers import LocalProvider
    except ImportError as exc:
        raise RuntimeError(
            "Parsl is not installed. Install this project with `pip install -e "
            "'.[ensemble]'`."
        ) from exc

    run_path = Path(run_dir).expanduser().resolve()
    run_path.mkdir(parents=True, exist_ok=True)

    if execution_target == "local":
        workers = max_workers or min(4, os.cpu_count() or 1)
        executor = HighThroughputExecutor(
            label="mace_htex",
            max_workers_per_node=workers,
            provider=LocalProvider(
                init_blocks=1,
                min_blocks=1,
                max_blocks=1,
            ),
        )
    elif execution_target == "aurora":
        worker_init = os.getenv("ATPESC_AURORA_WORKER_INIT")
        if not worker_init:
            raise RuntimeError(
                "ATPESC_AURORA_WORKER_INIT is required for Aurora. Set it to "
                "the module-load and shared-venv activation command."
            )

        node_count = _pbs_node_count()
        tile_names = [f"{gpu}.{tile}" for gpu in range(6) for tile in range(2)]
        executor = HighThroughputExecutor(
            label="mace_htex",
            heartbeat_period=30,
            heartbeat_threshold=240,
            address=address_by_interface("bond0"),
            available_accelerators=tile_names,
            max_workers_per_node=max_workers or len(tile_names),
            provider=LocalProvider(
                nodes_per_block=node_count,
                init_blocks=1,
                min_blocks=0,
                max_blocks=1,
                worker_init=worker_init,
                launcher=MpiExecLauncher(
                    bind_cmd="--cpu-bind",
                    overrides="--ppn 1",
                ),
            ),
        )
    else:
        raise ValueError("execution_target must be either 'local' or 'aurora'.")

    return Config(
        executors=[executor],
        run_dir=str(run_path),
        strategy="none",
    )
