# GRPO: Qwen2.5-3B-Instruct on the Countdown Game (Aurora)

Train **Qwen2.5-3B-Instruct** to solve [Countdown](https://en.wikipedia.org/wiki/Countdown_(game_show)#Numbers_round)-style arithmetic puzzles using Group Relative Policy Optimization (GRPO) on Aurora (Intel XPU). Full fine-tuning with FSDP.

Given a target number and a set of 3 input numbers, the model learns to produce an arithmetic expression that equals the target using basic operations (+, −, ×).

## Files

| File | Purpose |
|------|---------|
| `../setup_env.sh` | Create Python venv with TRL, PEFT, accelerate |
| `../configure_ccl.sh` | oneCCL / libfabric / PALS env vars (sourced by `run_grpo.sh`) |
| `generate_countdown.py` | Generate solvable Countdown puzzles as JSONL |
| `countdown_rewards.py` | Single TinyZero-style reward function (0.0 / 0.1 / 1.0) |
| `train_grpo.py` | Training script (FSDP or DDP, supports multiple models) |
| `run_grpo.sh` | Launcher (`mpiexec --ppn 12`, env vars, CCL tuning) |
| `submit_grpo.sh` | PBS batch job script |
| `generate_hf.py` | Test the trained model on countdown puzzles |

## How GRPO Works

GRPO is a reinforcement learning method for language models that avoids the need for a separate critic network. For each prompt:

1. **Generate** a group of completions from the current policy
2. **Score** each completion with a reward function
3. **Normalize** rewards within the group (subtract mean, divide by std)
4. **Update** the policy to increase probability of above-average completions

The reward function scores each completion with a single TinyZero-style score:
- **0.0** — no `<answer>` tags found (format failure)
- **0.1** — valid format but wrong answer or wrong numbers used
- **1.0** — correct answer using exactly the provided numbers

## Step-by-step Guide

### 1. Clone this repository to Aurora

On Aurora:

```bash
export PROJECT_PATH=/path/to/your/project/
git clone https://github.com/argonne-lcf/ATPESC_MachineLearning.git
```

### 2. Set up environment

```bash
cd ${PROJECT_PATH}/ATPESC_MachineLearning/06_post_training/grpo
source ../setup_env.sh
```

`setup_env.sh` loads frameworks, creates the venv (first time only), and activates it.

### 3. Submit training job

#### Option A: Interactive session (recommended for debugging)

```bash
qsub -I -l select=1 -l walltime=01:00:00 -l filesystems=home:flare -A ATPESC2026 -q ATPESC
```

Then inside the session:

```bash
export PROJECT_PATH=/path/to/your/project/
cd ${PROJECT_PATH}/ATPESC_MachineLearning/06_post_training/grpo
bash run_grpo.sh
```

#### Option B: PBS batch job

```bash
qsub submit_grpo.sh
```

Edit `submit_grpo.sh` to change the allocation (`-A`), queue (`-q`), or training hyperparameters (`EXTRA_ARGS`).

### 4. Monitor training

```bash
# Job status
qstat -u $USER

# Tail the latest log
tail -n 20 $(ls -t ./runlogs/run_grpo_*.log | head -1)
```

Expected behavior:
- Each step generates 4 completions per prompt, scores them, and updates the policy
- Step time is ~60–80 s on 1 node (12 XPU tiles) with FSDP
- Rewards should increase over training as the model learns valid expressions
- Entropy should decrease as the model becomes more focused

### 5. Test the models

#### Base model (before training)

```bash
MODEL_PATH=/lus/flare/projects/ATPESC2026/LLM_post-training/models/Qwen2.5-3B-Instruct python generate_hf.py
```

#### GRPO-trained model (after training)

```bash
MODEL_PATH=./output/Qwen2.5-3B-countdown-grpo/checkpoint-40 python generate_hf.py
```

The base model produces verbose reasoning that rarely arrives at correct expressions. The GRPO-trained model produces concise, structured completions with ~40–55% accuracy on the countdown task.

## Training Hyperparameters

| Parameter | Value | Notes |
|-----------|-------|-------|
| Model | Qwen2.5-3B-Instruct | 3.1B parameters |
| Distribution | FSDP (`Qwen2DecoderLayer` wrapping) | 3B model requires FSDP (DDP OOMs) |
| Batch size | 4 per tile | 12 tiles × 4 = 48 effective |
| Gradient accumulation | 1 | `grad_accum=2` causes OOM with this model |
| Learning rate | 5e-6 | Linear schedule with warmup |
| Warmup steps | 10 | |
| Max steps | 40 | |
| Num generations | 4 | Completions per prompt per step |
| Max completion length | 512 | Tokens per completion |
| Temperature | 1.0 | Sampling temperature for generation |
| Beta (KL coeff) | 0.0 | No reference model (saves memory) |
| Loss type | grpo | Standard GRPO objective |
| Num iterations | 2 | PPO epochs per batch |
| Epsilon | 0.2 | PPO-style clipping |
| Scale rewards | group | Normalize rewards within each group |
| Weight decay | 0.01 | |
| Synthetic samples | 50,000 | Generated on the fly |

### Environment variables

Override defaults via environment variables before launching:

```bash
export MODEL_DIR=/path/to/model        # default: Qwen2.5-3B-Instruct
export OUTDIR=./output/my-run           # default: ./output/Qwen2.5-3B-countdown-grpo
export NUM_SAMPLES=100000               # default: 50000
export EXTRA_ARGS="--lr 2e-6 --max_steps 100"  # append extra CLI args
```

## Training Results (40 steps, 1 node)

Reward improved from ~0.23 (baseline) to 0.71 over 40 steps (~26 minutes, ~37 s/step):

| Step | Reward | Entropy | Mean Completion Length |
|------|--------|---------|-----------------------|
| 2    | 0.233  | 0.932   | 407                   |
| 6    | 0.413  | 0.980   | 362                   |
| 10   | 0.367  | 0.787   | 383                   |
| 16   | 0.440  | 0.650   | 332                   |
| 22   | 0.700  | 0.491   | 229                   |
| 30   | 0.640  | 0.442   | 243                   |
| 32   | 0.769  | 0.376   | 221                   |
| 40   | 0.715  | 0.357   | 214                   |

The model learns to produce concise, structured completions (mean length drops from 407 to ~214 tokens) and achieves ~55–77% correct answers on the countdown task.

## Notes

### FSDP vs DDP

The 3B model does not fit on a single XPU tile under DDP. FSDP with `Qwen2DecoderLayer` wrapping is required. When using FSDP, gradient checkpointing is disabled (FSDP handles memory sharding). For smaller models (e.g., SmolLM2-1.7B), DDP works fine — pass `--no_fsdp`.

### Mode collapse

With high learning rates and few generations, the model can collapse to a narrow output distribution. With `num_iterations=2`, entropy stays healthier (minimum ~0.36 vs <0.13 with `num_iterations=1`). To mitigate further: use lower LR (2e-6), more generations (8), higher temperature (1.2), or `--loss_type dapo` (includes entropy bonus).

### Key differences from SFT

| | SFT | GRPO |
|---|-----|------|
| Signal | Ground-truth tokens | Reward functions |
| Learning rate | 3e-4 | 5e-6 (much lower — RL is less stable) |
| Batch composition | One forward pass | Generate group → score → policy update |
| Memory | Forward + backward | Forward + generation + reward + backward |
| Step time | ~2 s/step | ~60–80 s/step (generation overhead) |
| Distribution | DDP (1.7B) | FSDP required for 3B models |
