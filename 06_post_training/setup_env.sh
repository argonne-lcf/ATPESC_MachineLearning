#!/bin/bash
set -eo pipefail

if [ -n "${BASH_SOURCE[0]}" ]; then
    SCRIPT_PATH="${BASH_SOURCE[0]}"
elif [ -n "$ZSH_VERSION" ]; then
    SCRIPT_PATH="${(%):-%x}"
else
    SCRIPT_PATH="$0"
fi
SCRIPT_DIR="$(cd -- "$(dirname -- "$SCRIPT_PATH")" && pwd)"
export VENV_PATH="${VENV_PATH:-/lus/flare/projects/ATPESC2026/LLM_post-training/venv}"

module load frameworks

if [ -d "$VENV_PATH" ]; then
    source "${VENV_PATH}/bin/activate"
else
    echo "Creating venv at ${VENV_PATH}"

    export HTTP_PROXY="http://proxy.alcf.anl.gov:3128"
    export HTTPS_PROXY="$HTTP_PROXY"

    python3 -m venv --system-site-packages "$VENV_PATH"
    source "${VENV_PATH}/bin/activate"

    pip install 'trl>=1.6.0' --no-deps
    pip install peft --no-deps
    pip install accelerate --no-deps
    pip install wandb --no-deps

    echo "=== Environment created ==="
fi
