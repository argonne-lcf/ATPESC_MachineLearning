#!/bin/bash -l
#PBS -A ATPESC2026
#PBS -l select=1
#PBS -N hello_parsl
#PBS -l walltime=0:10:00
#PBS -l filesystems=home:flare
#PBS -k doe
#PBS -q ATPESC

cd $PBS_O_WORKDIR

# Avoids "OSError: AF_UNIX path too long" in single node jobs on Aurora
export TMPDIR=/tmp

source ../0_activate_preinstall.sh

python hello_injob_orchestration.py
