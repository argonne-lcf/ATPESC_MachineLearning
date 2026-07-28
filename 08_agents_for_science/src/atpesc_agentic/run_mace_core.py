"""Framework-independent MACE execution.

This module deliberately knows nothing about LangGraph, LangChain, MCP, or
Parsl.  The tutorial examples add those adapters around :func:`run_mace_core`
so participants can see the boundary between scientific code and agent code.
"""

from __future__ import annotations

import os
import time
from pathlib import Path
from typing import Literal

from ase.io import read
from pydantic import BaseModel, Field

Backend = Literal["mace", "emt"]
Device = Literal["cpu", "xpu"]


class MaceResult(BaseModel):
    """Structured result returned by one calculator evaluation."""

    status: Literal["success", "error"]
    structure_path: str
    formula: str | None = None
    num_atoms: int | None = None
    energy_ev: float | None = Field(
        default=None,
        description="Total potential energy in electron volts.",
    )
    backend: str
    model: str
    device: str
    dtype: str
    wall_time_s: float = Field(ge=0)
    error_type: str | None = None
    error_message: str | None = None


def _mace_calculator(model: str, device: Device, dtype: str) -> object:
    """Create a MACE-MP calculator."""

    try:
        from mace.calculators import mace_mp
    except ImportError as exc:
        raise RuntimeError(
            "MACE is not installed. Run `./install.sh` to build the full "
            "environment, or explicitly use backend='emt' for the lightweight "
            "teaching fallback."
        ) from exc

    os.environ.setdefault("TORCH_FORCE_NO_WEIGHTS_ONLY_LOAD", "1")
    return mace_mp(
        model=model,
        device=device,
        default_dtype=dtype,
        dispersion=False,
    )


def _calculator(backend: Backend, model: str, device: Device, dtype: str) -> object:
    if backend == "mace":
        return _mace_calculator(model, device, dtype)

    if device != "cpu":
        raise ValueError("The ASE EMT fallback supports only device='cpu'.")
    from ase.calculators.emt import EMT

    return EMT()


def run_mace_core(
    structure_path: str,
    model: str = "small",
    device: Device = "cpu",
    backend: Backend = "mace",
) -> MaceResult:
    """Calculate the single-point potential energy of an atomic structure.

    Args:
        structure_path: Path to any structure format readable by ASE.
        model: MACE-MP model name or model-file path. Ignored by EMT.
        device: Compute device: ``cpu`` or ``xpu`` (Aurora Intel GPU).
        backend: ``mace`` for the scientific example or explicit ``emt`` for
            a lightweight installation check.

    Returns:
        A structured result. Scientific and input failures are returned with
        ``status="error"`` so an agent can reason about them.
    """

    started = time.perf_counter()
    path = Path(structure_path).expanduser().resolve()
    dtype = "float32" if device == "xpu" else "float64"
    result_base = {
        "structure_path": str(path),
        "backend": backend,
        "model": model,
        "device": device,
        "dtype": dtype,
    }

    try:
        if backend not in ("mace", "emt"):
            raise ValueError("backend must be either 'mace' or 'emt'.")
        if device not in ("cpu", "xpu"):
            raise ValueError("device must be one of: cpu, xpu.")
        if not path.is_file():
            raise FileNotFoundError(f"Structure file does not exist: {path}")

        atoms = read(path)
        calculator = _calculator(backend, model, device, dtype)
        atoms.calc = calculator

        energy_ev = float(atoms.get_potential_energy())

        return MaceResult(
            status="success",
            formula=atoms.get_chemical_formula(),
            num_atoms=len(atoms),
            energy_ev=energy_ev,
            wall_time_s=time.perf_counter() - started,
            **result_base,
        )
    except Exception as exc:  # return failures in a form an agent can inspect
        return MaceResult(
            status="error",
            wall_time_s=time.perf_counter() - started,
            error_type=type(exc).__name__,
            error_message=str(exc),
            **result_base,
        )
