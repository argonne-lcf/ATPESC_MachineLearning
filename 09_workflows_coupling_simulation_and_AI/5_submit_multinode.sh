#!/bin/bash -l
#PBS -N simAI
#PBS -A ATPESC2026
#PBS -q ATPESC
#PBS -l select=2
#PBS -l walltime=0:30:00
#PBS -l filesystems=home:flare
#PBS -k doe
#PBS -j oe

cd $PBS_O_WORKDIR

# Activate the environment
source 0_activate_env.sh

# Run workflows
echo -e "\n\nRunning Parsl implementation using futures ..."
python 2_parsl_futures.py

echo -e "\n\nRunning Parsl implementation using IO to disk ..."
python 3_parsl_io.py

echo -e "\n\nRunning Dragon implementation using DDict ..."
dragon 4_dragon.py
