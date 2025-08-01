#!/bin/bash -l
#PBS -A ATPESC2025
#PBS -l select=2
#PBS -N task_launching_test
#PBS -l walltime=0:10:00
#PBS -l filesystems=home:flare
#PBS -k doe
#PBS -l place=scatter
#PBS -q ATPESC

cd $PBS_O_WORKDIR

module load frameworks
conda activate /flare/ATPESC2025/EXAMPLES/track3-workflows/_demo_env

echo "Running parsl test"
python ./1_parsl_tasks.py

echo ""
echo "Running dragon test"
dragon ./2_dragon_tasks.py
