#!/bin/bash
#COBALT -n 1
#COBALT -t 1:00:0
#COBALT -A datascience
#COBALT -q debug-flat-quad


echo "Running Cobalt Job $COBALT_JOBID."

#Loading modules
module load datascience/keras-2.3.0 datascience/tensorflow-1.15

## load module for Vtune
module load vtune
source /soft/compilers/intel/19.0.3.199/vtune_amplifier/amplxe-vars.sh 
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/soft/compilers/intel/19.0.3.199/vtune_amplifier/lib64
export PMI_NO_FORK=1

PROC_PER_NODE=1
# (A) run the following command to collect hotspots
aprun -n 1 -N 1 amplxe-cl -c hotspots -finalization-mode=none -knob sampling-mode=hw -r vtune-result-dir_advancedhotspots -strategy ldconfig:notrace:notrace -- python keras_mnist.py

# (B) From login node
# amplxe-cl -finalize -search-dir / -r vtune-result-dir_advancedhotspots

## steps to visualize results
# (C) tunnel with ssh -XL to run GUI or copy to local machine
# amplxe-gui  vtune-result-dir_advancedhotspots


