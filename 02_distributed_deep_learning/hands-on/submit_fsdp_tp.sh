#!/bin/bash -l

module load frameworks
source  /path/to/new/venv/bin/activate
WANDB_DISABLED=1 # Disable Weights & Biases logging
ezpz-launch python3 -m ezpz.examples.fsdp_tp --dataset random --tp=4 