#!/usr/bin/env python3

import sys
import time
import random
import math
import numpy as np
from mpi4py import MPI

def generate_samples(num_samples, min_range, max_range):
    """Generate uniformly distributed samples in [min_range, max_range)"""
    return np.random.uniform(min_range, max_range, num_samples)

def func(x):
    """Function we want to use to generate data"""
    return math.sin(x)

def f(input_array):
    """Apply sin(x) to the elements of the input array."""
    return np.array([func(x) for x in input_array])

def main():
    if len(sys.argv) != 5:
        print("Wrong number of input args", file=sys.stderr)
        sys.exit(1)
    
    # If we don't sleep this job sometimes finishes and prints faster than we can connect to the output
    time.sleep(1)
    
    num_samples_per_rank = int(sys.argv[1])
    min_sample_range = float(sys.argv[2])
    max_sample_range = float(sys.argv[3])
    num_calls = int(sys.argv[4])
    
    # Initialize MPI
    comm = MPI.COMM_WORLD
    world_rank = comm.Get_rank()
    world_size = comm.Get_size()
    
    # Generate samples
    global_samples = None
    if world_rank == 0:
        global_samples = generate_samples(num_samples_per_rank * world_size, 
                                       min_sample_range, max_sample_range)
    
    # Scatter out samples
    local_samples = np.empty(num_samples_per_rank, dtype=np.float32)
    comm.Scatter(global_samples, local_samples, root=0)
    
    # Compute sin(x) at each rank's set of the samples
    f_local = f(local_samples)
    
    # Get samples from ranks
    f_global = None
    if world_rank == 0:
        f_global = np.empty(num_samples_per_rank * world_size, dtype=np.float32)
    
    comm.Gather(f_local, f_global, root=0)
    
    # If rank 0 print out the samples
    if world_rank == 0:
        for i in range(num_samples_per_rank * world_size):
            print(f"{global_samples[i]:.6f}, {f_global[i]:.6f}")
            sys.stdout.flush()
    
    # Barrier to ensure all processes complete before finalizing
    comm.Barrier()

if __name__ == "__main__":
    main() 