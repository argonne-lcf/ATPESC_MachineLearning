#!/bin/bash -l
# GRPO launcher — mpiexec -ppn 12 (one MPI rank per XPU tile).
# Trains Qwen2.5-3B-Instruct on the Countdown game using GRPO with FSDP.

if [ -n "${BASH_SOURCE[0]}" ]; then
    SCRIPT_PATH="${BASH_SOURCE[0]}"
elif [ -n "$ZSH_VERSION" ]; then
    SCRIPT_PATH="${(%):-%x}"
else
    SCRIPT_PATH="$0"
fi
export GRPO_DIR="$(cd -- "$(dirname -- "$SCRIPT_PATH")" && pwd)"

source "${GRPO_DIR}/../setup_env.sh"

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

source "${GRPO_DIR}/../configure_ccl.sh"

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

mkdir -p "${GRPO_DIR}/runlogs"
export RUNLOG="${GRPO_DIR}/runlogs/run_grpo_$(date +%Y%m%d_%H%M%S).log"

# ── Paths (override via env) ─────────────────────────────────────────────────
export MODEL_DIR="${MODEL_DIR:-/lus/flare/projects/ATPESC2026/LLM_post-training/models/Qwen2.5-3B-Instruct}"
export OUTDIR="${OUTDIR:-${GRPO_DIR}/output/Qwen2.5-3B-countdown-grpo}"
export SCRIPT="${GRPO_DIR}/train_grpo.py"
export NUM_SAMPLES="${NUM_SAMPLES:-50000}"
export EXTRA_ARGS="${EXTRA_ARGS:-}"

mpiexec --hostfile "$PBS_NODEFILE" -n "$((NNODES * NRANKS_PER_NODE))" --ppn "$NRANKS_PER_NODE" \
  --genvall \
  /bin/bash -c '
    source /etc/profile && source ~/.bashrc
    source "${GRPO_DIR}/../setup_env.sh"
    export HF_HOME="${HF_HOME}"
    export HF_DATASETS_CACHE="$HF_HOME"

    # Re-apply CCL/libfabric vars that module load may override
    source "${GRPO_DIR}/../configure_ccl.sh"

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
        --output_dir  "$OUTDIR" \
        --num_samples "$NUM_SAMPLES" \
        --batch_size  4 \
        --grad_accum  1 \
        --lr          5e-6 \
        --warmup_steps 10 \
        --max_steps   40 \
        --num_generations 4 \
        --max_completion_length 512 \
        --temperature 1.0 \
        --beta        0.0 \
        --loss_type   grpo \
        --fsdp_transformer_layer_cls Qwen2DecoderLayer \
        --logging_steps 2 \
        --save_steps  40 \
        --save_limit  1 \
        --num_workers 0 \
        --log_completions \
        $EXTRA_ARGS
  ' 2>&1 | tee -a "$RUNLOG"

echo "Run log: $RUNLOG"
echo "Output dir: ${OUTDIR}"
