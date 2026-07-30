#!/bin/bash -l
#PBS -A ATPESC2025
#PBS -l select=2
#PBS -N ml_in_the_loop
#PBS -l walltime=0:30:00
#PBS -l filesystems=home:flare
#PBS -k doe
#PBS -l place=scatter
#PBS -q debug

cd $PBS_O_WORKDIR

module load frameworks
conda activate /flare/ATPESC2025/EXAMPLES/track3-workflows/_demo_env

echo "Running parsl ml_in_the_loop.py script"
python ./3_ml_in_the_loop.py
