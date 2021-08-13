#!/bin/bash
#COBALT -n 16
#COBALT -t 2:00:00
#COBALT -q ATPESC2021
#COBALT -A ATPESC2021

module load datascience/tensorflow-2.3

PROC_PER_NODE=4
for n in 1 2 4 8
do
    aprun -n $((n*PROC_PER_NODE)) -N $PROC_PER_NODE -j 2 -d 32 -e OMP_NUM_THREADS=32 -e KMP_BLOCKTIME=0 -cc depth python 03_keras_cnn_concise_hvd.py --device cpu >& concise_$n.out.knl & 
done
wait 

export HOROVOD_TIMELINE=cpu.json
export LD_PRELOAD="$LD_PRELOAD /soft/perftools/hpctw/INTEL/libhpmprof.so"
aprun -n $((n*PROC_PER_NODE)) -N $PROC_PER_NODE -j 2 -d 32 -e OMP_NUM_THREADS=32 -e KMP_BLOCKTIME=0 -cc depth python 03_keras_cnn_concise_hvd.py --device cpu 
