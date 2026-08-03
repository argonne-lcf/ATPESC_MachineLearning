#!/bin/bash -l
# SFT launcher — mpiexec -ppn 12 (one MPI rank per XPU tile).
# Adapted from post-training/systems/aurora/run_sft.sh for single-node
# SmolLM2-1.7B training. Works for multi-node too if PBS allocates more.

if [ -n "${BASH_SOURCE[0]}" ]; then
    SCRIPT_PATH="${BASH_SOURCE[0]}"
elif [ -n "$ZSH_VERSION" ]; then
    SCRIPT_PATH="${(%):-%x}"
else
    SCRIPT_PATH="$0"
fi
export SFT_DIR="$(cd -- "$(dirname -- "$SCRIPT_PATH")" && pwd)"

source "${SFT_DIR}/../setup_env.sh"

export HF_HOME="${HF_HOME:-${HOME}/.cache/huggingface}"
export HF_TOKEN="${HF_TOKEN:-$(cat ${HOME}/.cache/huggingface/token 2>/dev/null)}"
export PYTHONUNBUFFERED=1
export WANDB_MODE=offline

export HTTP_PROXY="http://proxy.alcf.anl.gov:3128"
export HTTPS_PROXY="$HTTP_PROXY"
export http_proxy="$HTTP_PROXY"
export https_proxy="$HTTP_PROXY"
export ftp_proxy="$HTTP_PROXY"
export no_proxy="admin,localhost,*.alcf.anl.gov"

export ZE_FLAT_DEVICE_HIERARCHY=FLAT
export ZE_AFFINITY_MASK="0,1,2,3,4,5,6,7,8,9,10,11"

source "${SFT_DIR}/../configure_ccl.sh"

# ── Node/rank setup ──────────────────────────────────────────────────────────
mapfile -t NODES < "$PBS_NODEFILE"
export NNODES=${#NODES[@]}
export NRANKS_PER_NODE="${NRANKS_PER_NODE:-12}"
export MASTER_NODE="${NODES[0]}"
if [[ "$MASTER_NODE" == *.hsn.cm.*.alcf.anl.gov ]]; then
    export MASTER_ADDR="$MASTER_NODE"
else
    export MASTER_ADDR="${MASTER_NODE}.hsn.cm.aurora.alcf.anl.gov"
fi
export MASTER_PORT=$((20000 + RANDOM % 20000))
export GLOO_USE_IPV6=0

echo "MASTER=$MASTER_ADDR:$MASTER_PORT  NNODES=$NNODES  PPN=$NRANKS_PER_NODE"

mkdir -p "${SFT_DIR}/runlogs"
export RUNLOG="${SFT_DIR}/runlogs/run_sft_$(date +%Y%m%d_%H%M%S).log"

# ── Paths (override via env) ─────────────────────────────────────────────────
export MODEL_DIR="${MODEL_DIR:-/lus/flare/projects/ATPESC2026/LLM_post-training/models/SmolLM2-1.7B}"
export DATASET="${DATASET:-/lus/flare/projects/ATPESC2026/LLM_post-training/data/smoltalk_train.jsonl}"
export OUTDIR="${OUTDIR:-${SFT_DIR}/output/SmolLM2-1.7B-smoltalk-sft}"
export SCRIPT="${SFT_DIR}/train_sft.py"
export EXTRA_ARGS="${EXTRA_ARGS:-}"

mpiexec --hostfile "$PBS_NODEFILE" -n "$((NNODES * NRANKS_PER_NODE))" --ppn "$NRANKS_PER_NODE" \
  --genvall \
  /bin/bash -c '
    source /etc/profile && source ~/.bashrc
    source "${SFT_DIR}/../setup_env.sh"
    export HF_HOME="${HF_HOME}"
    export HF_DATASETS_CACHE="$HF_HOME"

    # Re-apply CCL/libfabric vars that module load may override
    source "${SFT_DIR}/../configure_ccl.sh"

    # Map MPI/PALS env vars to torch distributed env vars
    export RANK="${PMI_RANK:-${PMIX_RANK:-${PALS_RANKID:-0}}}"
    export LOCAL_RANK="${PALS_LOCAL_RANKID:-0}"
    export WORLD_SIZE="${PMI_SIZE:-$((NNODES * NRANKS_PER_NODE))}"
    export LOCAL_WORLD_SIZE="${NRANKS_PER_NODE}"

    # Resolve CCL_LOCAL_RANK/SIZE for CCL_PROCESS_LAUNCHER=none
    for v in CCL_LOCAL_RANK PALS_LOCAL_RANKID; do
      [ -n "${!v-}" ] && export CCL_LOCAL_RANK="${!v}" && break
    done
    for v in CCL_LOCAL_SIZE PALS_LOCAL_SIZE; do
      [ -n "${!v-}" ] && export CCL_LOCAL_SIZE="${!v}" && break
    done

    echo "HOST=$(hostname) RANK=$RANK LOCAL_RANK=$LOCAL_RANK WORLD_SIZE=$WORLD_SIZE" >&2

    [ "$RANK" -eq 0 ] && mkdir -p "$OUTDIR"

    python "$SCRIPT" \
        --model_id    "$MODEL_DIR" \
        --dataset     "$DATASET" \
        --output_dir  "$OUTDIR" \
        --no_fsdp \
        --batch_size  4 \
        --grad_accum  2 \
        --lr          3e-4 \
        --warmup_steps 200 \
        --max_steps   500 \
        --max_seq_length 2048 \
        --lr_scheduler cosine \
        --weight_decay 0.01 \
        --logging_steps 5 \
        --save_steps  500 \
        --save_limit  1 \
        --num_workers 0 \
        $EXTRA_ARGS
  ' 2>&1 | tee -a "$RUNLOG"

echo "Run log: $RUNLOG"
echo "Output dir: ${OUTDIR}"
