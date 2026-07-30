"""Parsl ensemble execution built on the shared MACE core."""

from __future__ import annotations

import atexit
import time
from pathlib import Path
from typing import Literal

from pydantic import BaseModel, Field

from atpesc_agentic.parsl_config import get_aurora_config
from atpesc_agentic.run_mace_core import Backend, Device, MaceResult

# Common ASE-readable structure file extensions used when a directory is given.
STRUCTURE_EXTENSIONS = frozenset(
    {
        ".xyz",
        ".extxyz",
        ".cif",
        ".pdb",
        ".poscar",
        ".vasp",
        ".cml",
        ".sdf",
        ".mol",
        ".gen",
        ".traj",
    }
)


def _expand_structure_paths(structure_paths: list[str]) -> list[Path]:
    """Expand each entry into concrete files, recursing into any directories.

    A directory entry is searched recursively for files whose suffix is a
    recognized structure extension. File entries are kept as-is (even if they do
    not exist) so the per-structure error path still reports them. The combined
    result is de-duplicated and sorted for deterministic ordering.
    """

    collected: list[Path] = []
    for raw in structure_paths:
        path = Path(raw).expanduser().resolve()
        if path.is_dir():
            collected.extend(
                candidate
                for candidate in path.rglob("*")
                if candidate.is_file()
                and candidate.suffix.lower() in STRUCTURE_EXTENSIONS
            )
        else:
            collected.append(path)
    return sorted(set(collected), key=str)


class EnsembleResult(BaseModel):
    """Structured result returned by a Parsl ensemble."""

    status: Literal["success", "partial_failure", "error"]
    total: int = Field(ge=0)
    succeeded: int = Field(ge=0)
    failed: int = Field(ge=0)
    wall_time_s: float = Field(ge=0)
    results: list[MaceResult]
    error_message: str | None = None


_DFK = None
_PARSL_APP = None


def _get_parsl_app(
    *,
    run_dir: str | Path,
    max_workers: int | None,
):
    """Load Parsl on the first ensemble call and reuse it until process exit."""

    global _DFK, _PARSL_APP

    if _PARSL_APP is not None:
        return _PARSL_APP

    try:
        import parsl
        from parsl import python_app
    except ImportError as exc:
        raise RuntimeError("Parsl is not installed. Install `.[ensemble]`.") from exc

    config = get_aurora_config(
        run_dir=run_dir,
        max_workers_per_node=max_workers,
    )
    _DFK = parsl.load(config)

    @python_app(executors=["mace_htex"])
    def run_one(job: dict) -> dict:
        from atpesc_agentic.run_mace_core import run_mace_core

        return run_mace_core(**job).model_dump()

    _PARSL_APP = run_one
    return _PARSL_APP


def shutdown_parsl() -> None:
    """Close tutorial Parsl workers; useful for tests and explicit teardown."""

    global _DFK, _PARSL_APP

    if _DFK is None:
        return
    try:
        _DFK.cleanup()
    finally:
        import parsl

        parsl.clear()
        _DFK = None
        _PARSL_APP = None


atexit.register(shutdown_parsl)


def run_mace_ensemble_core(
    structure_paths: list[str],
    model: str = "small",
    device: Device = "xpu",
    backend: Backend = "mace",
    run_dir: str = "runs/parsl",
    max_workers: int | None = None,
) -> EnsembleResult:
    """Run one shared-core energy calculation per structure using Parsl on Aurora.

    Each entry in ``structure_paths`` may be an ASE-readable structure file or a
    directory. Directories are searched recursively for files with a recognized
    structure extension (see :data:`STRUCTURE_EXTENSIONS`).
    """

    started = time.perf_counter()
    paths = _expand_structure_paths(structure_paths)
    if not paths:
        return EnsembleResult(
            status="error",
            total=0,
            succeeded=0,
            failed=0,
            wall_time_s=time.perf_counter() - started,
            results=[],
            error_message="At least one structure path is required.",
        )

    try:
        app = _get_parsl_app(
            run_dir=run_dir,
            max_workers=max_workers,
        )
        futures = [
            (
                path,
                app(
                    {
                        "structure_path": str(path),
                        "model": model,
                        "device": device,
                        "backend": backend,
                    }
                ),
            )
            for path in paths
        ]

        results: list[MaceResult] = []
        for path, future in futures:
            try:
                results.append(MaceResult.model_validate(future.result()))
            except Exception as exc:
                results.append(
                    MaceResult(
                        status="error",
                        structure_path=str(path),
                        backend=backend,
                        model=model,
                        device=device,
                        dtype="float32" if device == "xpu" else "float64",
                        wall_time_s=0,
                        error_type=type(exc).__name__,
                        error_message=str(exc),
                    )
                )
    except Exception as exc:
        return EnsembleResult(
            status="error",
            total=len(paths),
            succeeded=0,
            failed=len(paths),
            wall_time_s=time.perf_counter() - started,
            results=[],
            error_message=str(exc),
        )

    succeeded = sum(result.status == "success" for result in results)
    failed = len(results) - succeeded
    if succeeded == len(results):
        status = "success"
    elif succeeded:
        status = "partial_failure"
    else:
        status = "error"

    return EnsembleResult(
        status=status,
        total=len(results),
        succeeded=succeeded,
        failed=failed,
        wall_time_s=time.perf_counter() - started,
        results=results,
    )
