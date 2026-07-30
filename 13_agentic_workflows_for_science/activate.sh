#!/usr/bin/env bash
# Activate the ATPESC module 08 environment. Source this in every new shell:
#
#   source activate.sh
#
# It loads Intel's XPU PyTorch, activates the venv built by ./install.sh, and
# points MACE's model cache at MACE_CACHE_DIR (default: <repo>/mace_models).
# Override the cache to a pre-staged/shared location by exporting MACE_CACHE_DIR
# before sourcing this script.
#
# This is also the command to give Parsl workers on Aurora (Example 3):
#   export ATPESC_AURORA_WORKER_INIT="source /path/to/repo/activate.sh"

_ATPESC_ROOT="/lus/flare/projects/ATPESC2026/EXAMPLES/track-6-agentic-workflows-for-science/ATPESC_MachineLearning/13_agentic_workflows_for_science"

# Lmod's init references unset vars (e.g. ZSH_EVAL_CONTEXT) that trip `set -u`.
# Disable nounset around `module load`, then restore the caller's setting (this
# script is sourced, so we must not leave their shell state changed).
case $- in *u*) _atpesc_had_u=1 ;; *) _atpesc_had_u=0 ;; esac
set +u
module load frameworks
[ "${_atpesc_had_u}" = 1 ] && set -u
unset _atpesc_had_u

source "${_ATPESC_ROOT}/.venv/bin/activate"

export MACE_CACHE_DIR="${MACE_CACHE_DIR:-${_ATPESC_ROOT}/mace_models}"
export XDG_CACHE_HOME="${MACE_CACHE_DIR}"

# For using ALCF inference service from compute node
export http_proxy="proxy.alcf.anl.gov:3128"
export https_proxy="proxy.alcf.anl.gov:3128"

# For using MCP
export NO_PROXY=127.0.0.1,localhost,::1
export no_proxy=127.0.0.1,localhost,::1

