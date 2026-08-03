#!/bin/bash -l
#PBS -N atpesc-intro-dl
#PBS -l select=1:system=polaris
#PBS -l place=scatter
#PBS -l walltime=00:20:00
#PBS -l filesystems=home:eagle
#PBS -A ATPESC2026
#PBS -q debug
# During the ATPESC2026 reservation window, switch -q above to:
#   ATPESC        (daytime session reservation)
#   ATPESC-Night  (evening session reservation)
# Confirm the reservation is live first: pbs_rstat -f
# Outside the reservation window, "debug" or "prod" is correct.

# Batch (non-interactive) run of the notebooks in this directory:
#   01_introduction_mnist.py  -- linear vs. nonlinear model on MNIST
#   02_conv_networks.py       -- CNN on MNIST
# Submit from this directory (or `qsub 01_intro_to_deep_learning/run.sh` from
# the repo root): qsub run.sh
# This is a batch/PBS alternative to the interactive Colab / ALCF JupyterHub
# path in README.md -- useful for a reproducible run outside the live
# tutorial window, not a replacement for the hands-on session itself.

WORKDIR="$(cd "$(dirname "${0}")" && pwd)"
cd "$WORKDIR" || exit 1

mkdir -p logs outputs
exec > logs/atpesc-intro-dl.out 2> logs/atpesc-intro-dl.err

# Polaris compute nodes have no direct outbound internet by default; MNIST's
# download needs the ALCF proxy (docs.alcf.anl.gov/polaris/getting-started).
export http_proxy="http://proxy.alcf.anl.gov:3128"
export https_proxy="http://proxy.alcf.anl.gov:3128"
export HTTP_PROXY="$http_proxy"
export HTTPS_PROXY="$https_proxy"
export no_proxy="admin,localhost,*.cm.polaris.alcf.anl.gov,polaris-adminvm-01,*.polaris.alcf.anl.gov"

module use /soft/modulefiles
module load conda
conda activate

export OUTDIR="$WORKDIR/outputs"

echo "=== 01_introduction_mnist.py ==="
python 01_introduction_mnist.py

echo "=== 02_conv_networks.py ==="
python 02_conv_networks.py

echo "Done. Figures in $OUTDIR, logs in $WORKDIR/logs"
