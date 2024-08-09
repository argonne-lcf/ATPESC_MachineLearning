#!/bin/bash -l
#PBS -l walltime=00:30:00
#PBS -l nodes=4:ppn=4
#PBS -N atpesc_horovod
#PBS -k doe
#PBS -j oe
#PBS -A ATPESC_2024

module use /soft/modulefiles
module load conda; conda activate
NODES=$(sort ${PBS_NODEFILE} | uniq -c | sort -n | wc -l)
GPUS_PER_NODE=4
RANKS=$((NODES * GPUS_PER_NODE))
echo NODES=$NODES  PPN=$GPUS_PER_NODE  RANKS=$RANKS

aprun -n 1 -N 1 python Horovod/04_keras_cnn_concise_hvd.py 
aprun -n 2 -N 2 python Horovod/04_keras_cnn_concise_hvd.py 
aprun -n 4 -N 4 python Horovod/04_keras_cnn_concise_hvd.py 
aprun -n 8 -N 4 python Horovod/04_keras_cnn_concise_hvd.py 
aprun -n 16 -N 4 python Horovod/04_keras_cnn_concise_hvd.py 
