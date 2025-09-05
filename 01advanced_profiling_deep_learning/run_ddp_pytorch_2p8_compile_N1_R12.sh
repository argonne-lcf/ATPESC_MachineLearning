#! /bin/bash -x
#
# Source the PyTorch 2.8 environment
source /lus/flare/projects/datasets/softwares/training/atpesc_2025_aiml_profiling/ATPESC_MachineLearning/01advanced_profiling_deep_learning/atpesc_2025_pytorch_2p8.env

NNODES=`wc -l < $PBS_NODEFILE`
NRANKS_PER_NODE=12

let NRANKS=${NNODES}*${NRANKS_PER_NODE}

N=12
PPN=12
EPOCHS=10

export ZE_FLAT_DEVICE_HIERARCHY=FLAT
export FI_MR_CACHE_MONITOR=userfaultfd

export CCL_PROCESS_LAUNCHER=pmix

export CPU_AFFINITY="list:4-7:8-11:12-15:16-19:20-23:24-27:56-59:60-63:64-67:68-71:72-75:76-79"
export CCL_WORKER_AFFINITY="42,43,44,45,46,47,94,95,96,97,98,99"
export ZE_AFFINITY_MASK="0,1,2,3,4,5,6,7,8,9,10,11"

mpiexec -n ${N} -ppn ${PPN} -l --line-buffer --cpu-bind ${CPU_AFFINITY} python pytorch_2p8_ddp_compile.py
