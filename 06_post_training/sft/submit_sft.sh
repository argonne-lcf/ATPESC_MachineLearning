#!/bin/bash -l
#PBS -l select=4,place=scatter
#PBS -l walltime=01:00:00
#PBS -l filesystems=home:flare
#PBS -A ATPESC2026
#PBS -q ATPESC
#PBS -k doe
#PBS -j oe

cd "${PBS_O_WORKDIR}"

bash run_sft.sh
