#qsub -l select=16:system=polaris -l walltime=00:30:00 -A ATPESC2022 -q R313446 ./qsub_polaris_03_keras_cnn_concise_hvd.sh 

#!/bin/bash -l
#PBS -l walltime=00:30:00
#PBS -l select=16:ncpus=64:ngpus=4
#PBS -N atpesc_horovod
#PBS -k doe
#PBS -j oe
#PBS -A ATPESC2022


module load conda/2022-07-19; conda activate

NODES=$(cat $PBS_NODEFILE | wc -l)
GPUS_PER_NODE=4
RANKS=$((NODES * GPUS_PER_NODE))
echo NODES=$NODES  PPN=$GPUS_PER_NODE  RANKS=$RANKS

mpiexec -n 1 --ppn 1 --hostfile $PBS_NODEFILE -- python ./03_keras_cnn_concise_hvd.py 
mpiexec -n 2 --ppn 2 --hostfile $PBS_NODEFILE -- python ./03_keras_cnn_concise_hvd.py 
mpiexec -n 4 --ppn 4 --hostfile $PBS_NODEFILE -- python ./03_keras_cnn_concise_hvd.py 
mpiexec -n 8 --ppn 4 --hostfile $PBS_NODEFILE -- python ./03_keras_cnn_concise_hvd.py 
mpiexec -n 16 --ppn 4 --hostfile $PBS_NODEFILE -- python ./03_keras_cnn_concise_hvd.py 
mpiexec -n 32 --ppn 4 --hostfile $PBS_NODEFILE -- python ./03_keras_cnn_concise_hvd.py 
mpiexec -n 64 --ppn 4 --hostfile $PBS_NODEFILE -- python ./03_keras_cnn_concise_hvd.py 
