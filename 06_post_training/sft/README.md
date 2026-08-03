# SFT: SmolLM2-1.7B on SmolTalk (Aurora)

Fine-tune **SmolLM2-1.7B** on the **HuggingFaceTB/smoltalk** dataset (~1.04M conversations) using DDP across 2 Aurora nodes (24 XPU tiles). Full fine-tuning with assistant-only loss masking.

This follows the training recipe from the [SmolLM2 paper](https://arxiv.org/abs/2502.02737) (Section 4 / Appendix F), adapted for Intel XPU.

## Files

| File | Purpose |
|------|---------|
| `../setup_env.sh` | Create Python venv with TRL, PEFT, accelerate |
| `prepare_smoltalk.py` | Download SmolLM2-1.7B model and SmolTalk dataset, convert to JSONL |
| `train_sft.py` | Training script (DDP, assistant-only loss) |
| `run_sft.sh` | Launcher (`mpiexec --ppn 12`, env vars, CCL tuning) |
| `submit_sft.sh` | PBS batch job script (4 nodes) |
| `../configure_ccl.sh` | oneCCL / libfabric / PALS env vars (sourced by `run_sft.sh`) |
| `chatml.jinja` | ChatML chat template with `{% generation %}` markers |

## Training Results (2 nodes, 500 steps)

| Step | Loss | Token Accuracy | Tokens (M) |
|-----:|-----:|---------------:|-----------:|
| 1 | 3.368 | 0.416 | 0.2 |
| 100 | 0.797 | 0.765 | 16.3 |
| 500 | 0.741 | 0.778 | 81.4 |

- Step time: ~3.5 s/step on 2 Aurora nodes (`grad_accum=2`)
- Total runtime: ~30 minutes for 500 steps
- Model shows proper instruction-following early in training

## Step-by-step Guide

### 1. Clone this repository to Aurora

On Aurora:

```bash
export PROJECT_PATH=/path/to/your/project/
git clone https://github.com/argonne-lcf/ATPESC_MachineLearning.git
```

### 2. Set up environment and download data

```bash
cd ${PROJECT_PATH}/ATPESC_MachineLearning/06_post_training/sft
source ../setup_env.sh
python prepare_smoltalk.py
```

`setup_env.sh` loads frameworks, creates the venv (first time only), and activates it.
`prepare_smoltalk.py` downloads the model and dataset if not already present. Defaults:
- Model: `/lus/flare/projects/ATPESC2026/LLM_post-training/models/SmolLM2-1.7B`
- Data: `/lus/flare/projects/ATPESC2026/LLM_post-training/data/smoltalk_{train,test}.jsonl`

**Note:** The download may take 10–20 minutes depending on network speed. The train JSONL file will be ~2–3 GB.

### 3. Submit training job (2 nodes, 500 steps)

#### Option A: Interactive session

```bash
qsub -I -l select=2 -l walltime=01:00:00 -l filesystems=home:flare -A ATPESC2026 -q ATPESC
```

Then inside the session (re-export `PROJECT_PATH` — the compute node starts a fresh shell):

```bash
export PROJECT_PATH=/path/to/your/project/
cd ${PROJECT_PATH}/ATPESC_MachineLearning/06_post_training/sft
bash run_sft.sh
```

#### Option B: PBS batch job

```bash
qsub submit_sft.sh
```

Edit `submit_sft.sh` to change the allocation (`-A`) or queue (`-q`). Training hyperparameters can be overridden via `EXTRA_ARGS` in `run_sft.sh`.


### 4. Monitor training

```bash
# Job status
qstat -u $USER

# tail or grep the log file, e.g.
tail -n 20 $(ls -t runlogs/run_sft_*.log | head -1)"
```

Expected behavior:
- 500 steps, checkpoint at step 500 (final model only)
- Loss drops from 3.37 to ~0.79 in the first 100 steps, to ~0.74 by step 500
- Step time ~3.5 s/step (~30 minutes total)
- Token accuracy 76.6% at step 100, 77.8% at step 500

### 5. Test the models

#### Base model (before fine-tuning)

On a compute node:

```bash
MODEL_PATH=/lus/flare/projects/ATPESC2026/LLM_post-training/models/SmolLM2-1.7B python generate_hf.py --raw
```

#### Fine-tuned model (after training)

```bash
MODEL_PATH=./output/SmolLM2-1.7B-smoltalk-sft/checkpoint-500 python generate_hf.py
```

#### Example outputs

Prompt: *"What is the capital of France? What is the capital of Spain?"*

**Base model** (`--raw`, no chat template):
> What is the capital of Japan?
> Answers: London, Madrid, Tokyo
> Vocabulary: city, capital
> Now that we have some vocabulary, let's try another one. What is the capital of France?
> Answers: Paris ...

**Checkpoint 500** (step 500, loss 0.736):
> The capital of France is Paris, and the capital of Spain is Madrid.

## Training Hyperparameters

| Parameter | Value | Notes |
|-----------|-------|-------|
| Batch size | 4 per tile | 24 tiles × 4 × 2 `grad_accum` = 192 effective |
| Gradient accumulation | 2 | Keeps global batch size at 192 with 2 nodes |
| Learning rate | 3e-4 | Paper's SFT setting (cosine schedule) |
| Warmup steps | 200 | 40% of total |
| Max seq length | 2048 | Covers most SmolTalk conversations |
| Weight decay | 0.01 | |
| Max steps | 500 | |
| Save interval | 500 steps | Final checkpoint only (save_limit=1) |
| Loss masking | assistant-only | Via TRL `{% generation %}` markers |
| Distribution | DDP (`--no_fsdp`) | 1.7B fits in single tile (64 GB HBM) |

### Paper's hyperparameters (for reference)

| Parameter | Paper value |
|-----------|-------------|
| Epochs | 2 |
| Global batch size | 128 |
| Sequence length | 8,192 |
| Learning rate | 3e-4 |

To match the paper more closely, increase `--max_seq_length 8192` and reduce `--batch_size 2` (to avoid OOM at longer sequences). This will increase step time significantly.
