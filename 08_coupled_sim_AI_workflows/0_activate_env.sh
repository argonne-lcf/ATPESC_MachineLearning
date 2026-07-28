#!/bin/bash

if hostname -f | grep -q "aurora"; then
    if hostname -f | grep -q "uan"; then
        echo "Setting up environment for ALCF Aurora login nodes"
        module load frameworks
        conda activate /flare/ATPESC2026/usr/balin/_atpesc_simAI
    else
        echo "Setting up environment for ALCF Aurora compute nodes"
        NODES=$(cat ${PBS_NODEFILE} | wc -l)
        mpiexec -np "${NODES}" -ppn 1 /flare/ATPESC2026/usr/balin/bcast/bcast \
          /flare/ATPESC2026/usr/balin/_atpesc_simAI.tar.gz /tmp
        mpiexec -np "${NODES}" -ppn 1 mkdir -p /tmp/_atpesc_simAI
        mpiexec -np "${NODES}" -ppn 1 tar -xzf /tmp/_atpesc_simAI.tar.gz -C /tmp/_atpesc_simAI
        mpiexec -np "${NODES}" -ppn 1 /tmp/_atpesc_simAI/bin/python /tmp/_atpesc_simAI/bin/conda-unpack
        module load frameworks
        conda activate /tmp/_atpesc_simAI
        module load xpu-smi
        export TMPDIR=/tmp
        export MOLFORMER_WEIGHTS_DIR=/flare/ATPESC2026/usr/balin/model-weights/MolFormer-XL
        # Make chemfunctions.py and models/ importable from the workflow root,
        # even when Parsl workers cd into runinfo at startup.
        export PYTHONPATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd):${PYTHONPATH}"
        export PATH=/opt/cray/pals/1.8/bin:$PATH
        export OMP_NUM_THREADS=1
        export HF_HUB_DISABLE_PROGRESS_BARS=1
    fi
elif hostname -f | grep -q "polaris"; then
    echo "The environment for ALCF Polaris is not tested yet"
    exit 1
fi

