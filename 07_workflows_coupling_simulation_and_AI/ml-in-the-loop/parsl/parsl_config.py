import os
import parsl
from parsl.executors import HighThroughputExecutor
from parsl.providers import LocalProvider
from parsl.launchers import MpiExecLauncher
from parsl.config import Config

# Get the number of nodes from the PBS_NODEFILE
pbs_node_file = os.getenv('PBS_NODEFILE')
num_nodes = 1
with open(pbs_node_file, 'r') as nf:
    nodes = nf.readlines()
    num_nodes = len(nodes)

# For this cpu only config, bind one worker per cpu core
cpu_affinity = "list"
num_cpus = 2
num_cores_per_cpu = 51 # first core on each cpu is reserved for system procs and should not be used
for cpu in range(num_cpus):
    core_start = cpu*52
    for core in range(num_cores_per_cpu):
        cpu_affinity += f":{core_start+core+1},{core_start+core+1+104}"

# Parsl config for cpu workers
aurora_config = Config(
    executors=[
        HighThroughputExecutor(
            max_workers_per_node=102, # We will use 102 workers, one for each CPU core
            cpu_affinity=cpu_affinity,  # Prevents thread contention
            prefetch_capacity=0,  # Increase if you have many more tasks than workers
            provider=LocalProvider(
                launcher=MpiExecLauncher(
                    bind_cmd="--cpu-bind", overrides="--ppn 1"
                ),  # Ensures 1 manger per node and allows it to divide work to all 64 cores
                nodes_per_block=num_nodes,
                init_blocks=1,
                max_blocks=1,
            ),
        ),
    ]
)
