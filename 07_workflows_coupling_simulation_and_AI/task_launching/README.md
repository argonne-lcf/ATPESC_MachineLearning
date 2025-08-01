# Task Launching

Here we demonstrate how to use workflow tools to launch an ensemble of tasks on Aurora GPU tiles.  This is a common component of AI/ML workflows.

We demonstrate with both Parsl and Dragon, two tools that have been used at scale on Aurora.

To run these examples first get an interactive compute node:
```shell
qsub -I -A datascience -q debug -l select=1 -l walltime=0:60:0 -l filesystems=home:flare
```

Once your interactive job has started, activate the demo environment:
```shell
module load frameworks
conda activate /flare/ATPESC2025/EXAMPLES/track3-workflows/_demo_env
```

## Parsl task launching

This simple test runs a python function that sleeps and reports the hostname and GPU tile it sees.

First we need to tell parsl how to distribute taks aross nodes.  This is done with a parsl `Config` object.  This `Config` runs one parsl worker process per GPU tile and assumes that all the nodes are locally available (it therefore should be run within a batch job).

```python
import os
from parsl.config import Config

# Use LocalProvider to launch workers within a submitted batch job
# Use LocalProvider to run tasks on local nodes within a batch job
from parsl.providers import LocalProvider
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

```

Use the `Config` object within a workflow script that runs the tasks.  This script defines a parsl "app", a python function that executes some code.  In this case we use a `python_app` which runs native python code, but the parsl `bash_app` can be used to run compiled executables.

A parsl app returns a `concurrent.futures` object that is a proxy for the task result.  While the future is unfullfilled, `future.result()` will wait.  The workflow script must wait in some fashion for all the futures created in the script to be fullfilled.

```python title="0_parsl_tasks.py"
# 0_parsl_tasks.py
import os
from parsl_config import aurora_single_tile_config
import parsl
from parsl.app.app import python_app


# A simple app to execute native python code; this app reports the pinned GPU tile and sleeps
# To execute a compiled appication with Parsl, use the bash_app decorator
# https://parsl.readthedocs.io/en/stable/userguide/apps/index.html
@python_app
def hello_gpu_affinity_py(sleep_time):
    import os
    from time import sleep
    sleep(sleep_time)
    return f"Hello from {os.getenv('HOSTNAME')} on tile {os.getenv('ZE_AFFINITY_MASK')}"

# Open a context with the Config
with parsl.load(aurora_single_tile_config):
    
    # Launch the tasks.
    futures = [hello_gpu_affinity_py(1) for i in range(12)]
    
    # Wait for all tasks to complete and print the results
    # Note that a wait on task completion must be included in the application script
    print("Output from python apps:")
    for future in futures:
        print(future.result())
    print("All tasks completed.")
```

Run this script with the command
```shell
python 0_parsl_tasks.py
```

## Dragon task launching

This simple test runs a python function that sleeps and reports the hostname and GPU tile it sees.

Dragon has a python API which we will use here.  The Dragon python API uses python multiprocessing API.  Dragon can therefore be used to extend scripts written for single shared memory devices with multiprocessing to run on multiple nodes without shared memory.

Dragon scripts are launched with the dragon application, included in the demo environment:

```shell
dragon 1_dragon_tasks.py
```

This simple script runs a python function that sleeps and reports the hostname and GPU tile it sees.  It runs an ensemble of these function calls in two ways, first, with a multiprocessing `Pool` enabled to use Dragon infrastructure, and second, with a dragon `ProcessGroup`, a native dragon object that allows for increased control in the placement of processes on hardware.

If this script were run on multiple nodes, you would see that the Pool runs processes across multiple nodes, not just the node local to the driver script.  This case however does not bind processes to particular GPU tiles or CPU threads.

The `ProcessGroup` uses a Dragon `Policy` to assign each process to specific hardware.  In this example, each process is bound to a unique GPU tile.  We can also select all the nodes or only a subset of nodes to run the `ProcessGroup` on.  Here we use all the nodes available, but this could be used to either co-locate or seperate processes running different applications within the workload.

```python title="1_dragon_tasks.py"
import os
import dragon
from dragon.infrastructure.policy import Policy
from dragon.native.machine import System, Node
from dragon.native.process_group import ProcessGroup
from dragon.native.process import ProcessTemplate
from multiprocessing import set_start_method, Pool
import numpy as np

# Optimal CPU and GPU affinities for Aurora Nodes
gpu_affinities = [[float(f'{gid}.{tid}')] for gid in range(6) for tid in range(2)]
cpu_affinities = [list(range(c, c+8)) for c in range(1, 52-8, 8)] + [list(range(c, c+8)) for c in range(53, 104-8, 8)]

# A simple function to demonstrate task execution and GPU affinity
def hello_gpu_affinity(sleep_time):
    import os
    from time import sleep
    sleep(sleep_time)
    print(f"Hello from {os.getenv('HOSTNAME')} on tile {os.getenv('ZE_AFFINITY_MASK')}", flush=True) 

if __name__ == '__main__':
    # Set the start method for multiprocessing to 'dragon'
    # This allows Dragon to manage process creation and affinity
    # This also allows for process launching across multiple nodes with the multiprocessing api
    set_start_method("dragon")

    # Number of processes to run in Pool and ProcessGroup
    num_procs = 12

    # Test 1:
    # Distribute tasks across availble cores with a simple pool
    # Unlike standard multiprocessing, Dragon will launch pool processes across multiple nodes
    # This pool does not use any GPU affinity
    print("Launching tasks with a simple Pool, no GPU affinity...", flush=True)
    sleep_times = np.ones(num_procs) * 1.0  # Sleep for 1 second each
    with Pool(num_procs) as p:
        results = p.map(hello_gpu_affinity, sleep_times)

    # Test 2:
    # Now distribute tasks with a Policy and ProcessGroup
    # This will launch processes across nodes with specific CPU and GPU affinities
    print("Launching tasks with specific CPU and GPU affinities...", flush=True)
    alloc = System()
    num_nodes = int(alloc.nnodes)
    nodelist = alloc.nodes
    run_dir = os.getcwd()

    # Create a ProcessGroup
    pg = ProcessGroup(pmi_enabled=False) # To run an application with mpi, set pmi_enabled=True
    
    # Assign processes to nodes with specific CPU and GPU affinities
    for node in nodelist:
        node_name = Node(node).hostname
        for proc in range(num_procs):
            local_policy = Policy(placement=Policy.Placement.HOST_NAME,
                                  host_name=node_name,
                                  cpu_affinity=cpu_affinities[proc],
                                  gpu_affinity=gpu_affinities[proc])
            pg.add_process(nproc=1, 
                        template=ProcessTemplate(target=hello_gpu_affinity, 
                                                     args=(1.0,), # sleep time
                                                     cwd=run_dir,
                                                     policy=local_policy,))
    
    pg.init()
    pg.start()

    pg.join()
    pg.close()
```