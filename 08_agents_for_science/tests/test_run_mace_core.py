from __future__ import annotations

from pathlib import Path

import pytest

from atpesc_agentic.run_mace_core import run_mace_core

ROOT = Path(__file__).resolve().parents[1]
WATER = ROOT / "data" / "structures" / "water.xyz"


def test_emt_single_point_is_structured() -> None:
    result = run_mace_core(str(WATER), backend="emt")

    assert result.status == "success"
    assert result.formula == "H2O"
    assert result.num_atoms == 3
    assert isinstance(result.energy_ev, float)
    assert result.backend == "emt"
    assert result.device == "cpu"
    assert result.wall_time_s >= 0


def test_missing_structure_is_a_tool_readable_error(tmp_path: Path) -> None:
    missing = tmp_path / "missing.xyz"
    result = run_mace_core(str(missing), backend="emt")

    assert result.status == "error"
    assert result.energy_ev is None
    assert result.error_type == "FileNotFoundError"
    assert str(missing) in (result.error_message or "")


def test_emt_rejects_accelerator_device() -> None:
    result = run_mace_core(str(WATER), backend="emt", device="xpu")

    assert result.status == "error"
    assert "only device='cpu'" in (result.error_message or "")


def test_mace_is_never_silently_replaced_by_emt() -> None:
    try:
        import mace  # noqa: F401
    except ImportError:
        result = run_mace_core(str(WATER), backend="mace")
        assert result.status == "error"
        assert "MACE is not installed" in (result.error_message or "")
    else:
        pytest.skip("MACE is installed; this assertion targets missing-MACE behavior")


def test_invalid_backend_is_a_structured_error() -> None:
    result = run_mace_core(str(WATER), backend="not-a-backend")  # type: ignore[arg-type]

    assert result.status == "error"
    assert "backend must be" in (result.error_message or "")
