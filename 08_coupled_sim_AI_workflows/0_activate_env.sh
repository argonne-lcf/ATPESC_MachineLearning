#!/bin/bash

if hostname -f | grep -q "aurora"; then
    echo "Setting up environment for ALCF Aurora"
    module load frameworks
    conda activate /flare/ATPESC2026/usr/balin/_atpesc_simAI
    export TMPDIR=/tmp
    export MOLFORMER_WEIGHTS_DIR=/flare/ATPESC2026/usr/balin/model-weights/MolFormer-XL
elif hostname -f | grep -q "polaris"; then
    echo "The environment for ALCF Polaris is not tested yet"
    exit 1
fi

