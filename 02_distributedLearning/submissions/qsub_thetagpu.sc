#!/bin/bash -l
#COBALT -n 1
#COBALT -t 0:15:00
#COBALT -q training-gpu 
#COBALT -A ATPESC2022


# source /lus/theta-fs0/software/thetagpu/conda/2021-06-26/mconda3/setup.sh

module load conda/2022-07-01; conda activate
export http_proxy=http://theta-proxy.tmi.alcf.anl.gov:3128
export https_proxy=https://theta-proxy.tmi.alcf.anl.gov:3128

mpirun -np 1 python 03_keras_cnn_concise_hvd.py >& concise_1.out.gpu
mpirun -np 2 python 03_keras_cnn_concise_hvd.py >& concise_2.out.gpu
mpirun -np 4 python 03_keras_cnn_concise_hvd.py >& concise_4.out.gpu
mpirun -np 8 python 03_keras_cnn_concise_hvd.py >& concise_8.out.gpu


HOROVOD_TIMELINE=gpu.json LD_PRELOAD=/soft/perftools/hpctw/lib/libmpitrace.so mpirun -np 8 python 03_keras_cnn_concise_hvd.py 
HOROVOD_TIMELINE=cpu.json LD_PRELOAD=/soft/perftools/hpctw/lib/libmpitrace.so mpirun -np 8 python 03_keras_cnn_concise_hvd.py  --device cpu

