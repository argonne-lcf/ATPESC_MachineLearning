import os
from time import perf_counter, perf_counter_ns
import torch
import numpy as np

import intel_extension_for_pytorch as ipex 
import oneccl_bindings_for_pytorch

def get_mpi_env():
    # Try common environment variables set by mpiexec (e.g. OpenMPI or PMI-based implementations)
    rank = os.environ.get("OMPI_COMM_WORLD_RANK") or os.environ.get("PMI_RANK") or os.environ.get("PALS_RANKID")
    world_size = os.environ.get("OMPI_COMM_WORLD_SIZE") or os.environ.get("PMI_SIZE") or os.environ.get("PALS_WORLD_SIZE") # N.B. PALS_WORLD_SIZE doesn't exist, need to set
    local_size = os.environ.get("OMPI_COMM_WORLD_LOCAL_SIZE") or os.environ.get("PMI_LOCAL_SIZE") or os.environ.get("PALS_LOCAL_SIZE")
    if rank is None:
        rank = 0
    else:
        rank = int(rank)

    if world_size is None:
        world_size = 1
    else:
        world_size = int(world_size)

    if local_size is None:
        local_size = 1
    else:
        local_size = int(local_size)
    return rank, world_size, local_size

# Get rank, world size, and local size from MPI environment variables
rank, world_size, local_size = get_mpi_env()

# Set device
local_rank = rank % local_size
torch.xpu.set_device(f"xpu:{local_rank}")
#torch.xpu.set_device(f"xpu:0")

# Initialize the process group using the environment variables: MASTER_ADDR and MASTER_PORT.
# Ensure set and exported when using mpiexec
torch.distributed.init_process_group(
    backend="ccl",
    init_method="env://",
    world_size=world_size,
    rank=rank,
)

torch.distributed.barrier()
#print(f"Rank {rank}/{world_size} initialized.")

# Allocate a large tensor on the xpu device.
input_ = torch.rand([1073741824, 1], dtype=torch.float32, device=f"xpu:{torch.xpu.current_device()}")
#input_ = torch.rand([ 268435456, 1], dtype=torch.float32, device=f"xpu:{torch.xpu.current_device()}")
#input_ = torch.rand([  67108864, 1], dtype=torch.float32, device=f"xpu:{torch.xpu.current_device()}")
#input_ = torch.rand([   8388608, 1], dtype=torch.float32, device=f"xpu:{torch.xpu.current_device()}")
#input_ = torch.rand([   1048576, 1], dtype=torch.float32, device=f"xpu:{torch.xpu.current_device()}")
#input_ = torch.rand([    131072, 1], dtype=torch.float32, device=f"xpu:{torch.xpu.current_device()}")
#input_ = torch.rand([     16384, 1], dtype=torch.float32, device=f"xpu:{torch.xpu.current_device()}")

# Preallocate a tensor to hold timings for 3 iterations (stored on CPU)
timing_tensor = torch.empty(5, dtype=torch.float32)

# Perform and time the all_reduce operation.
for i in range(5):
    torch.xpu.synchronize()
    start = perf_counter_ns()
    torch.distributed.all_reduce(input_)
    torch.xpu.synchronize()
    end = perf_counter_ns()
    elapsed = end - start
    #print(f"Rank {rank}: AR time: {elapsed}")
    timing_tensor[i] = elapsed/1e6

# Prepare a list for the gathered tensors on rank 0
if rank == 0:
    gathered_tensors = [torch.empty_like(timing_tensor) for _ in range(world_size)]
else:
    gathered_tensors = None

# Gather the timing tensors from all ranks to rank 0
torch.distributed.gather(timing_tensor, gather_list=gathered_tensors, dst=0)

if rank == 0:
    # Stack the gathered tensors into one tensor and compute statistics
    all_timings = torch.stack(gathered_tensors).cpu().numpy()
    timings_init = all_timings[:, 0].flatten()
    timings_flat = all_timings[:, 1:].flatten()
    print("Statistics Init:", 
          "\n    mean =", timings_init.mean(), 
          "\n     std =", timings_init.std(),
          "\n     min =", timings_init.min(), 
          "\n     max =", timings_init.max(),
          "\nStatistics Bench:",
          "\n    mean =", timings_flat.mean(), 
          "\n     std =", timings_flat.std(),
          "\n    min =", timings_flat.min(), 
          "\n    max =", timings_flat.max())

