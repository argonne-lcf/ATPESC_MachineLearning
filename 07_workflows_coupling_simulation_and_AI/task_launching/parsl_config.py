import os
from parsl.config import Config

# Use LocalProvider to launch workers within a submitted batch job
from parsl.providers import LocalProvider
# The high throughput executor is for scaling large single core/tile/gpu tasks on HPC system:
from parsl.executors import HighThroughputExecutor
# Use the MPI launcher to launch worker processes:
from parsl.launchers import MpiExecLauncher


# Get the number of nodes:
node_file = os.getenv("PBS_NODEFILE")
print(node_file)
with open(node_file,"r") as f:
    node_list = f.readlines()
    num_nodes = len(node_list)

tile_names = [f'{gid}.{tid}' for gid in range(6) for tid in range(2)]
cpu_affinity = "list:1-8,105-112:9-16,113-120:17-24,121-128:25-32,129-136:33-40,137-144:41-48,145-152:53-60,157-164:61-68,165-172:69-76,173-180:77-84,181-188:85-92,189-196:93-100,197-204"

# This config is suitable for running a workflow contained with a single batch job
aurora_single_tile_config = Config(
    executors=[
        HighThroughputExecutor(
            # Ensures one worker per GPU tile on each node
            available_accelerators=tile_names,
            max_workers_per_node=12,
            # Distributes threads to workers/tiles in a way optimized for Aurora
            cpu_affinity=cpu_affinity,
            # Increase if you have many more tasks than workers
            prefetch_capacity=0,
            # Options that specify properties provider
            provider=LocalProvider(
                # Number of nodes job
                nodes_per_block=num_nodes,
                launcher=MpiExecLauncher(bind_cmd="--cpu-bind", overrides="--ppn 1"),
                init_blocks=1,
                max_blocks=1,
            ),
        ),
    ],
)

