import os
import parsl
from parsl.executors import HighThroughputExecutor
from parsl.providers import LocalProvider
from parsl.launchers import MpiExecLauncher
from parsl.config import Config
from parsl.addresses import address_by_interface

# Get the number of nodes from the PBS_NODEFILE
pbs_node_file = os.getenv('PBS_NODEFILE')
num_nodes = 1
with open(pbs_node_file, 'r') as nf:
    nodes = nf.readlines()
    num_nodes = len(nodes)

# Parsl config for CPU workers
cpu_affinity = "list"
num_cpu_sockets = 2
num_cores_per_cpu = 51 # first core on each cpu is reserved for system procs and should not be used
for cpu in range(num_cpu_sockets):
    core_start = cpu*52
    for core in range(num_cores_per_cpu):
        cpu_affinity += f":{core_start+core+1}"

aurora_cpu_config = Config(
    initialize_logging=True, # Set to False for runs more than 1000 nodes
    executors=[
        HighThroughputExecutor(
            label="cpu",
            address=address_by_interface('hsn0'),
            max_workers_per_node=102, # We will use 102 workers, one for each core
            cpu_affinity=cpu_affinity,  # Prevents thread contention
            prefetch_capacity=0,  # Increase if you have many more tasks than workers
            provider=LocalProvider(
                launcher=MpiExecLauncher(
                    bind_cmd="--cpu-bind", overrides="--ppn 1"
                ),  # Ensures 1 manger per node and allows it to divide work to all 64 cores
                nodes_per_block=num_nodes,
                init_blocks=1,
                max_blocks=1,
                worker_init="cd runinfo", # Including this will make helper files write to runinfo
            ),
        ),
    ]
)

# Parsl config for GPU workers
aurora_gpu_config = Config(
    initialize_logging=True, # Set to False for runs more than 1000 nodes
    executors=[
        HighThroughputExecutor(
            label="gpu",
            address=address_by_interface('hsn0'),
            available_accelerators=12, # 12 PVC tiles per node
            max_workers_per_node=12, # We will use 12 workers, one for each tile
            # This gives optimal binding of threads to GPUs on an Aurora node
            cpu_affinity="list:1-8:9-16:17-24:25-32:33-40:41-48:53-60:61-68:69-76:77-84:85-92:93-100",
            prefetch_capacity=0,  # Increase if you have many more tasks than workers
            provider=LocalProvider(
                launcher=MpiExecLauncher(
                    bind_cmd="--cpu-bind", overrides="--ppn 1"
                ),  # Ensures 1 manger per node and allows it to divide work to all 64 cores
                nodes_per_block=num_nodes,
                init_blocks=1,
                max_blocks=1,
                worker_init="cd runinfo", # Including this will make helper files write to runinfo
            ),
        ),
    ]
)