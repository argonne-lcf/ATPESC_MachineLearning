#!/bin/bash
#COBALT -n 1
#COBALT -t 1:00:0
#COBALT -A datascience
#COBALT -q debug-flat-quad

echo "Running Cobalt Job $COBALT_JOBID."
unset PYTHONPATH

module load intelpython36
source /soft/compilers/intel/19.0.2.187/vtune_amplifier/amplxe-vars.sh
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/soft/compilers/intel/19.0.2.187/vtune_amplifier/lib64
export PMI_NO_FORK=1

INSTALL_DIR=/soft/datascience/horovod/v0.19.4-tf2-abi-py36/
TF_DIR=/soft/datascience/tensorflow/tf2.2-py36-login
export PYTHONPATH=${TF_DIR}:${INSTALL_DIR}/lib/python3.6/site-packages:$PYTHONPATH

# (A) run the following command to collect hotspots
aprun -n 1 -N 1 amplxe-cl -c hotspots -finalization-mode=none -knob sampling-mode=hw -r vtune-result-dir_advancedhotspots -strategy ldconfig:notrace:notrace -- python tf2_mnist.py

# (B) From login node
# amplxe-cl -finalize -search-dir / -r vtune-result-dir_advancedhotspots

## steps to visualize results
# (C) tunnel with ssh -XL to run GUI or copy to local machine
# amplxe-gui  vtune-result-dir_advancedhotspots
