import sys
import time
import math
from mpi4py import MPI

import dragon
from dragon.data.ddict import DDict

def factorial(n):
    """Compute factorial of n"""
    if n == 0:
        return 1
    return n * factorial(n - 1)

def taylor_expansion_local(rank, x):
    """Compute local Taylor expansion term for sin(x)"""
    coeff = 2 * rank + 1
    te_f_local = ((-1.0) ** rank) / factorial(coeff) * (x ** coeff)
    return te_f_local

def main():
    # Initialize MPI
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()

    # Check command line args
    if len(sys.argv) != 2:
        print("Wrong number of input args", file=sys.stderr)
        sys.exit(1)
    
    # If we don't sleep this job sometimes finishes and prints faster than we can connect to the output
    time.sleep(1)
    
    # Attach to the DDict
    dd_serialized = sys.argv[1]
    dd = DDict.attach(dd_serialized)
    
    # Compute Taylor expansion of sin(x)
    x = dd['x']
    partial_te = taylor_expansion_local(rank, x)
    full_te = comm.reduce(partial_te, op=MPI.SUM, root=0)
    
    # Write result of the Taylor expansion of sin(x)
    if rank == 0:
        dd['approximation'] = full_te

    dd.detach()
    comm.Barrier()

if __name__ == "__main__":
    main() 