"""Aurora-only Parsl configuration for the MACE ensemble example.

Mirrors the ChemGraph HPC config pattern in
``chemgraph/hpc_configs/aurora_parsl.py`` so tutorial participants see the
same shape they will meet in real ChemGraph deployments.
"""

from __future__ import annotations

import os
from pathlib import Path


def resolve_worker_init(run_dir: str) -> str:
    """Build a Parsl ``worker_init`` snippet for Aurora XPU workers.

    Precedence:

    1. ``ATPESC_WORKER_INIT`` env var, used verbatim.
    2. Default: source ``modules.sh``, ``module load frameworks``, then
       activate the submitter's virtualenv. The frameworks module is what
       exposes SYCL / Level Zero to the worker so ``torch.xpu.is_available()``
       returns ``True`` -- activating the venv alone is not enough because
       the venv is built with ``--system-site-packages`` from the frameworks
       Python and inherits ``torch`` from there.

    ``export TMPDIR=/tmp; cd {run_dir}`` is always prepended, matching the
    ChemGraph pattern so workers land in the same directory as the submitter.
    """
    override = os.environ.get("ATPESC_WORKER_INIT", "").strip()
    if override:
        activate = override
    else:
        venv = os.environ.get("VIRTUAL_ENV", "").strip()
        if not venv:
            raise RuntimeError(
                "VIRTUAL_ENV is not set. Activate the ATPESC .venv before "
                "starting the server, or set ATPESC_WORKER_INIT to a shell "
                "snippet that loads frameworks and activates the environment."
            )
        activate = (
            "source /etc/profile.d/modules.sh; "
            "module load frameworks; "
            f"source {venv}/bin/activate"
        )
    return f"export TMPDIR=/tmp; cd {run_dir}; {activate}"


def _pbs_node_count() -> int:
    node_file = os.getenv("PBS_NODEFILE")
    if not node_file:
        raise RuntimeError(
            "PBS_NODEFILE is not set. Start the Aurora server inside an "
            "active PBS allocation."
        )
    path = Path(node_file)
    if not path.is_file():
        raise RuntimeError(f"PBS_NODEFILE does not exist: {path}")
    hosts = [line.strip() for line in path.read_text().splitlines() if line.strip()]
    if not hosts:
        raise RuntimeError(f"PBS_NODEFILE contains no worker hosts: {path}")
    return len(hosts)


def get_aurora_config(
    run_dir: str | Path | None = None,
    worker_init: str | None = None,
    max_workers_per_node: int | None = None,
):
    """Create a Parsl configuration for Aurora PBS jobs.

    Parameters
    ----------
    run_dir : str or Path, optional
        Directory used as Parsl's run directory and worker working directory.
        Defaults to the current working directory.
    worker_init : str, optional
        Explicit shell snippet for worker init. When ``None`` (default),
        :func:`resolve_worker_init` builds one that loads the frameworks
        module and activates the submitter's venv.
    max_workers_per_node : int, optional
        Overrides ``ATPESC_PARSL_MAX_WORKERS_PER_NODE`` (default 9).
    """
    try:
        from parsl.addresses import address_by_interface
        from parsl.config import Config
        from parsl.executors import HighThroughputExecutor
        from parsl.launchers import MpiExecLauncher
        from parsl.providers import LocalProvider
    except ImportError as exc:
        raise RuntimeError(
            "Parsl is not installed. Install this project with "
            "`pip install -e '.[ensemble]'`."
        ) from exc

    if run_dir is None:
        run_dir = os.getcwd()
    run_path = Path(run_dir).expanduser().resolve()
    run_path.mkdir(parents=True, exist_ok=True)
    run_dir_str = str(run_path)

    if worker_init is None:
        worker_init = resolve_worker_init(run_dir_str)

    if max_workers_per_node is None:
        max_workers_per_node = int(
            os.getenv("ATPESC_PARSL_MAX_WORKERS_PER_NODE", "12")
        )

    num_nodes = _pbs_node_count()

    config = Config(
        executors=[
            HighThroughputExecutor(
                label="mace_htex",
                heartbeat_period=30,
                heartbeat_threshold=240,
                available_accelerators=12,
                max_workers_per_node=max_workers_per_node,
                address=address_by_interface("bond0"),
                provider=LocalProvider(
                    nodes_per_block=num_nodes,
                    launcher=MpiExecLauncher(
                        bind_cmd="--cpu-bind", overrides="--ppn 1"
                    ),
                    init_blocks=1,
                    worker_init=worker_init,
                    max_blocks=1,
                    min_blocks=0,
                ),
            )
        ],
        run_dir=run_dir_str,
    )
    return config
