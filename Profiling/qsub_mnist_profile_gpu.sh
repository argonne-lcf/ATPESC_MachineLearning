#!/bin/sh
#COBALT -n 1
#COBALT -t 1:00:00
#COBALT -A datascience
#COBALT -q default

IMG=/soft/datascience/singularity/tensorflow/centos7-cuda10.0-tf1.14.img

## the following steps can be run

# (A) get flat-profile using nvprof
#singularity exec --nv ${IMG} nvprof --log-file mnist_profile.log python keras_mnist.py --log_dir ./mnist_logs/

# (B) get metrics of all gemm kernels 
#singularity exec --nv ${IMG} nvprof --log-file mnist_selective_profile.log --kernels "::gemm:1" --metrics all python keras_mnist.py --log_dir ./mnist_logs/

# (C) use GUI 
# (C.1) collect profile output using nvprof
singularity exec --nv ${IMG} nvprof -o mnist_cnn_profile.nvprof python keras_mnist.py --log_dir ./mnist_logs/

## steps to visualize results
# (C.2) tunnel using ssh -XL to enable GUI or copy mnist_profile.nvprof to local machine which has Nvidia Visual Profiler (NVVP) installed.
# nvvp mnist_profile.nvprof 




