#!/bin/bash

#Set environment variables
export CCL_WORKER_AFFINITY="5,13,21,29,37,45,57,65,73,81,89,97"
export CPU_BIND="list:2-4:10-12:18-20:26-28:34-36:42-44:54-56:62-64:70-72:78-80:86-88:94-96"
export ZE_AFFINITY_MASK=0,1,2,3,4,5,6,7,8,9,10,11

export CCL_ATL_TRANSPORT=mpi
export CCL_KVS_MODE=mpi
export CCL_ALLREDUCE=topo
export CCL_ALLREDUCE_SCALEOUT=rabenseifner


module load frameworks

# Run Python Allreduce benchmark
mpiexec --no-transfer -n 24 --ppn 12 -env MASTER_ADDR=$(hostname) -env MASTER_PORT=2345 -env PALS_WORLD_SIZE=24 --cpu-bind=${CPU_BIND} python allreduce_bench.py


# Build oneCCL benchmark
cp -r /opt/aurora/24.347.0/oneapi/ccl/2021.14/share/doc/ccl/examples ./
cd examples/
mkdir build
cd build
cmake .. -DCMAKE_C_COMPILER=$(which icx) -DCMAKE_CXX_COMPILER=$(which icpx) -DCOMPUTE_BACKEND=dpcpp -DCMAKE_BUILD_TYPE=Release
make -j51
cd benchmark/

# Run oneCCL's C++ Allreduce benchmark
mpiexec --no-transfer -n 24 -ppn 12 $(pwd)/benchmark --elem_counts 1073741824,1073741824 --coll allreduce -j off -i 100 -w 10 --backend sycl --sycl_dev_type gpu
