#!/bin/bash -l
#COBALT -t 10
#COBALT -n 1
#COBALT -q single-gpu
#COBALT -O logdir/$COBALT_JOBID
#COBALT --attrs filesystems=home,eagle

echo [$SECONDS] setup conda environment
module load conda/2023-01-11
conda activate

echo [$SECONDS] python = $(which python)
echo [$SECONDS] python version = $(python --version)

echo [$SECONDS] setup local env vars
NODES=`cat $COBALT_NODEFILE | wc -l`
GPUS_PER_NODE=1
RANKS=$((NODES * GPUS_PER_NODE))
echo [$SECONDS] NODES=$NODES  GPUS_PER_NODE=$GPUS_PER_NODE  RANKS=$RANKS


export OMP_NUM_THREADS=1
export OMP_PLACES=threads
echo [$SECONDS] run example with $OMP_NUM_THREADS threads
mpirun -hostfile $COBALT_NODEFILE -n $RANKS -N $GPUS_PER_NODE \
   python ilsvrc_dataset.py -c ilsvrc.json --interop $OMP_NUM_THREADS --intraop $OMP_NUM_THREADS \
       --logdir logdir/t${OMP_NUM_THREADS}_${COBALT_JOBID}

export OMP_NUM_THREADS=4
echo [$SECONDS] run example with $OMP_NUM_THREADS threads
mpirun -hostfile $COBALT_NODEFILE -n $RANKS -N $GPUS_PER_NODE \
   python ilsvrc_dataset.py -c ilsvrc.json --interop $OMP_NUM_THREADS --intraop $OMP_NUM_THREADS \
       --logdir logdir/t${OMP_NUM_THREADS}_${COBALT_JOBID}

export OMP_NUM_THREADS=8
echo [$SECONDS] run example with $OMP_NUM_THREADS threads
mpirun -hostfile $COBALT_NODEFILE -n $RANKS -N $GPUS_PER_NODE \
   python ilsvrc_dataset.py -c ilsvrc.json --interop $OMP_NUM_THREADS --intraop $OMP_NUM_THREADS \
       --logdir logdir/t${OMP_NUM_THREADS}_${COBALT_JOBID}

export OMP_NUM_THREADS=16
echo [$SECONDS] run example with $OMP_NUM_THREADS threads
mpirun -hostfile $COBALT_NODEFILE -n $RANKS -N $GPUS_PER_NODE \
   python ilsvrc_dataset.py -c ilsvrc.json --interop $OMP_NUM_THREADS --intraop $OMP_NUM_THREADS \
       --logdir logdir/t${OMP_NUM_THREADS}_${COBALT_JOBID}

echo [$SECONDS] done
