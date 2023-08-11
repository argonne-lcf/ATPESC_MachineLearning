#!/bin/bash
#COBALT -n 16
#COBALT -t 2:00:00
#COBALT -q ATPESC2023
#COBALT -A ATPESC2023

module load conda/2022-07-19

PROC_PER_NODE=4
for n in 1 2 4 8
do
    aprun -n $((n*PROC_PER_NODE)) -N $PROC_PER_NODE -j 2 -d 32 -e OMP_NUM_THREADS=32 -e KMP_BLOCKTIME=0 -cc depth python Horovod/04_keras_cnn_concise_hvd.py --device cpu >& concise_$n.out.knl & 
done
wait 

export LD_PRELOAD="$LD_PRELOAD /soft/perftools/hpctw/INTEL/libhpmprof.so"
aprun -n $((n*PROC_PER_NODE)) -N $PROC_PER_NODE -j 2 -d 32 -e OMP_NUM_THREADS=32 -e KMP_BLOCKTIME=0 -cc depth python Horovod/04_keras_cnn_concise_hvd.py --device cpu 
