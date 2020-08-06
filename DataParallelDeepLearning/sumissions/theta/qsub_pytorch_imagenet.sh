#!/bin/bash
#COBALT -n 4
#COBALT -t 1:00:00
#COBALT -q training --attrs mcdram=cache:numa=quad
#COBALT -A SDL_Workshop -O pytorch_imagenet

#submisstion script for running tensorflow_mnist with horovod

echo "Running Cobalt Job $COBALT_JOBID."

#Loading modules
module load datascience/pytorch-1.1

PROC_PER_NODE=1

aprun -n $(($COBALT_JOBSIZE*$PROC_PER_NODE)) -N $PROC_PER_NODE \
    -j 2 -d 128 -cc depth \
    -e OMP_NUM_THREADS=128 \
    -e KMP_BLOCKTIME=0 \
    python pytorch_imagenet_resnet50.py --num_threads=128 --device cpu 

