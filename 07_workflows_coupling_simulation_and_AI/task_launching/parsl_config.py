import os
from parsl.config import Config

# Use LocalProvider to launch workers within a submitted batch job
# Use PBSProProvider to submit jobs to PBS Pro systems
from parsl.providers import LocalProvider, PBSProProvider
# The high throughput executor is for scaling large single core/tile/gpu tasks on HPC system:
from parsl.executors import HighThroughputExecutor
# Use the MPI launcher to launch worker processes:
from parsl.launchers import MpiExecLauncher


# Get the number of nodes:
node_file = os.getenv("PBS_NODEFILE")
try:
    with open(node_file,"r") as f:
        node_list = f.readlines()
        num_nodes = len(node_list)
except:
    num_nodes = 1

tile_names = [f'{gid}.{tid}' for gid in range(6) for tid in range(2)]

# This config is suitable for running a workflow contained with a single batch job
aurora_single_tile_config = Config(
    executors=[
        HighThroughputExecutor(
            # Ensures one worker per GPU tile on each node
            available_accelerators=tile_names,
            max_workers_per_node=12,
            # Distributes threads to workers/tiles in a way optimized for Aurora
            cpu_affinity="list:1-8,105-112:9-16,113-120:17-24,121-128:25-32,129-136:33-40,137-144:41-48,145-152:53-60,157-164:61-68,165-172:69-76,173-180:77-84,181-188:85-92,189-196:93-100,197-204",
            # Increase if you have many more tasks than workers
            prefetch_capacity=0,
            # Options that specify properties of PBS Jobs
            provider=LocalProvider(
                # Number of nodes job
                nodes_per_block=num_nodes,
                launcher=MpiExecLauncher(bind_cmd="--cpu-bind", overrides="--ppn 1"),
                init_blocks=1,
                max_blocks=1,
                worker_init='cd runinfo',
            ),
        ),
    ],
)

# This config is suitable for driving a workflow from a login node and running it across multiple batch jobs
elastic_aurora_single_tile_config = Config(
    executors=[
        HighThroughputExecutor(
            # Ensures one worker per GPU tile on each node
            available_accelerators=tile_names,
            max_workers_per_node=12,
            # Distributes threads to workers/tiles in a way optimized for Aurora
            cpu_affinity="list:1-8,105-112:9-16,113-120:17-24,121-128:25-32,129-136:33-40,137-144:41-48,145-152:53-60,157-164:61-68,165-172:69-76,173-180:77-84,181-188:85-92,189-196:93-100,197-204",
            # Increase if you have many more tasks than workers
            prefetch_capacity=0,
            # Options that specify properties of PBS Jobs
            provider=PBSProProvider(
                # Project name
                account="Aurora_deployment",
                # Submission queue
                queue="debug",
                # Commands run before workers launched
                # Make sure to activate your environment where Parsl is installed
                worker_init=f'''module load frameworks; conda activate moldesign-demo''',
                # Wall time for batch jobs
                walltime="0:10:00",
                # Change if data/modules located on other filesystem
                scheduler_options="#PBS -l filesystems=home:flare",
                # Ensures 1 manger per node; the manager will distribute work to its 12 workers, one per tile
                launcher=MpiExecLauncher(bind_cmd="--cpu-bind", overrides="--ppn 1"),
                # options added to #PBS -l select aside from ncpus
                select_options="",
                # Number of nodes per PBS job
                nodes_per_block=num_nodes,
                # Minimum number of concurrent PBS jobs running workflow
                min_blocks=0,
                # Maximum number of concurrent PBS jobs running workflow
                max_blocks=1,
            ),
        ),
    ],
)
