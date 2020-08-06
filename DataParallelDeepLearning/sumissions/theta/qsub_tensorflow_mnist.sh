#!/bin/bash
#COBALT -n 4
#COBALT -t 1:00:00
#COBALT -q training --attrs mcdram=cache:numa=quad
#COBALT -A SDL_Workshop -O tensorflow_mnist

#submisstion script for running tensorflow_mnist with horovod

echo "Running Cobalt Job $COBALT_JOBID."

#Loading modules
module load datascience/tensorflow-1.14

PROC_PER_NODE=1

aprun -n $(($COBALT_JOBSIZE*$PROC_PER_NODE)) -N $PROC_PER_NODE \
    -j 2 -d 128 -cc depth \
    -e OMP_NUM_THREADS=128 \
    -e KMP_BLOCKTIME=0 \
    python tensorflow_mnist.py --num_intra=128 --num_inter=2 --device cpu

