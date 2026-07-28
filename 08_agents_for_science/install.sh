#!/usr/bin/env bash
# One-step install for ATPESC 2026 module 08 — agentic AI for scientific workflows.
#
# Builds a single environment on Aurora with everything the module needs:
#   - Intel XPU PyTorch from the `frameworks` module (inherited via the venv)
#   - the ATPESC package plus Parsl, SQLite human-in-the-loop, and pytest
#   - MACE built for Aurora XPU (the alcf-dev fork), installed WITHOUT deps so it
#     uses the system XPU torch instead of pulling an upstream CUDA torch.
#
# Run from an Aurora login or compute node:
#   ./install.sh
#
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

# Intel XPU PyTorch + IPEX + oneCCL. Disable nounset around Lmod: its init
# script references unset vars (e.g. ZSH_EVAL_CONTEXT) that trip `set -u`.
set +u
module load frameworks
set -u

# Fresh venv that inherits the system (XPU) PyTorch from the frameworks module.
python3 -m venv .venv --system-site-packages
source .venv/bin/activate

python -m pip install --upgrade pip

# ATPESC package + all its (formerly optional) dependencies. No torch/MACE here.
python -m pip install -e .

# MACE for Aurora XPU: install the fork WITHOUT dependency resolution so pip does
# not replace the system XPU torch with an upstream CUDA build, then add MACE's
# own non-torch dependencies explicitly.
python -m pip install --no-deps "git+https://github.com/tdpham2/mace@alcf-dev"
python -m pip install \
    "e3nn==0.4.4" \
    opt_einsum \
    torch-ema \
    prettytable \
    matscipy \
    h5py \
    torchmetrics \
    python-hostlist \
    configargparse \
    GitPython \
    pyYAML \
    tqdm \
    lmdb \
    orjson \
    matplotlib \
    pandas

echo ""
echo "Install complete."
echo "For each new shell:  source activate.sh"
echo "Confirm the setup:   python scripts/check_setup.py"
echo "Run the tests with:  pytest"
