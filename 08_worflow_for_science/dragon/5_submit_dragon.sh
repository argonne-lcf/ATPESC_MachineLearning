#!/bin/bash -l
#PBS -A ATPESC2026
#PBS -l select=2
#PBS -N dragon_test
#PBS -l walltime=0:10:00
#PBS -l filesystems=home:flare
#PBS -k doe
#PBS -l place=scatter
#PBS -q ATPESC

cd $PBS_O_WORKDIR

source ../0_activate_preinstall.sh

dragon 1_dragon_pool.py
sleep 1
dragon 2_dragon_process_group.py
sleep 1
dragon 3_dragon_mpi_process_group.py
sleep 1
dragon 4_dragon_dictionary.py
