import sys
import time
import numpy as np

import dragon
from dragon.data.ddict import DDict

import mpi4py
mpi4py.rc.initialize = False
from mpi4py import MPI

def generate_samples(num_samples, min_range, max_range):
    """Generate uniformly distributed samples in [min_range, max_range)"""
    return np.random.uniform(min_range, max_range, num_samples)

def main():
    # Initialize MPI
    MPI.Init()
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()
    size = comm.Get_size()
    #print(f'Hello from sim-expensive.py rank {rank}/{size}',flush=True)

    # Check command line args
    if len(sys.argv) != 5:
        print("Wrong number of input args", file=sys.stderr)
        sys.exit(1)
    
    # If we don't sleep this job sometimes finishes and prints faster than we can connect to the output
    time.sleep(1)

    # Attach to the DDict
    dd_serialized = sys.argv[1]
    dd = DDict.attach(dd_serialized)
    
    # Parse other arguments
    num_samples_per_rank = int(sys.argv[2])
    min_sample_range = float(sys.argv[3])
    max_sample_range = float(sys.argv[4])
    
    # Generate samples and compute the target data locally
    local_samples = generate_samples(num_samples_per_rank, min_sample_range, max_sample_range)
    f_local = np.sin(local_samples)
    
    # Gather samples to rank 0
    global_samples = None
    f_global = None
    if rank == 0:
        global_samples = np.empty(num_samples_per_rank * size, dtype=np.float64)
        f_global = np.empty(num_samples_per_rank * size, dtype=np.float64)
    comm.Gather(local_samples, global_samples, root=0)
    comm.Gather(f_local, f_global, root=0)
    
    # If rank 0 write the training data and augment current dataset
    if rank == 0:
        if 'train_inputs' not in dd.keys():
            dd['train_inputs'] = global_samples
            dd['train_outputs'] = f_global
        else:
            inputs = dd['train_inputs']
            inputs = np.hstack((inputs,global_samples))
            dd['train_inputs'] = inputs
            outputs = dd['train_outputs']
            outputs = np.hstack((outputs,f_global))
            dd['train_outputs'] = outputs

    dd.detach()
    comm.Barrier()
    MPI.Finalize()

if __name__ == "__main__":
    main() 