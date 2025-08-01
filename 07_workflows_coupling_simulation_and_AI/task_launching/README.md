# Task Launching

This directory demonstrates how to launch ensembles of tasks on Aurora GPU tiles using two workflow tools: Parsl and Dragon. Both tools are showcased with example scripts that illustrate their usage for distributing tasks across nodes and GPU tiles, which is a common requirement in AI/ML workflows.

## Getting started

To run these examples first get an interactive compute node:
```shell
qsub -I -A ATPESC2025 -q ATPESC -l select=1 -l walltime=0:60:0 -l filesystems=home:flare
```

Once your interactive job has started, activate the demo environment:
```shell
module load frameworks
conda activate /flare/ATPESC2025/EXAMPLES/track3-workflows/_demo_env
```

## Parsl task launching

This simple test runs a python function that sleeps and reports the hostname and GPU tile it sees pinned by `ZE_AFFINITY_MASK`.

First we need to tell parsl how to distribute tasks aross nodes.  This is done with a parsl `Config` object.  This configuration `aurora_single_tile_config` runs one parsl worker process per Aurora GPU tile and assumes that all the nodes are locally available (it therefore should be run within a batch job).

**parsl_config.py**
```python
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

# Optimal CPU and GPU affinities for Aurora Nodes
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
```
Use the `Config` object within a workflow script that runs the tasks.  This script defines a parsl "app", a python function that executes some code.  In this case we use a `python_app` which runs native python code, but the parsl `bash_app` can be used to run compiled executables.

A parsl app returns a `concurrent.futures` object that is a proxy for the task result.  While the future is unfullfilled, execution of the command `future.result()` will wait.  The workflow script must wait in some fashion for all the futures created in the script to be fullfilled, so this a useful command.

Run the example script by running:
```shell
python 1_parsl_tasks.py
```

**1_parsl_tasks.py**
```python
import os
from parsl_config import aurora_single_tile_config
import parsl
from parsl.app.app import python_app


# A simple app to execute native python code; this app reports the pinned GPU tile and sleeps
# To execute a compiled appication with Parsl, use the bash_app decorator
# Parsl docs have more information on apps:
# https://parsl.readthedocs.io/en/stable/userguide/apps/index.html
@python_app
def hello_gpu_affinity_py(sleep_time):
    import os
    from time import sleep
    from socket import gethostname

    sleep(sleep_time)
    hostname = gethostname()
    tile_name = os.getenv('ZE_AFFINITY_MASK')
    
    return f"Hello from {hostname} on tile {tile_name}"


# Open a context with the Config
with parsl.load(aurora_single_tile_config):
    
    # Run 12 tasks per node
    num_nodes = aurora_single_tile_config.executors[0].provider.nodes_per_block
    num_tasks = 12 * num_nodes
    print(f"Launching {num_tasks} tasks on {num_nodes} nodes.")

    # Launch the tasks.
    futures = [hello_gpu_affinity_py(10) for i in range(num_tasks)]
    
    # Wait for all tasks to complete and print the results
    # Note that a parsl script must wait on task completion
    print("Output from python app tasks:")
    for future in py_futures:
        print(future.result())

    print("All tasks completed.")
```
## Dragon task launching

This simple test runs a python function that sleeps and reports the hostname and GPU tile it sees pinned by `ZE_AFFINITY_MASK`.

Dragon has a python API which we will use here.  The Dragon python API uses python's `multiprocessing` API.  Dragon can therefore be used to extend scripts written for single shared memory devices with `multiprocessing` to run on multiple nodes without shared memory.

Dragon scripts are launched with the dragon application, included in the demo environment.  To run the example script:

```shell
dragon 2_dragon_tasks.py
```

This script runs an ensemble of tasks in two ways, first, with a `multiprocessing` `Pool` enabled to use Dragon infrastructure, and second, with a dragon `ProcessGroup`, a native dragon object that allows for increased control in the placement of processes on hardware.

When run on multiple nodes, both methods of task launching would distribute tasks across all the nodes.

The `ProcessGroup` uses a Dragon `Policy` to assign each process to specific hardware.  In this example, each process is bound to a unique GPU tile.  We can also select all the nodes or only a subset of nodes to run the `ProcessGroup` on.  Here we use all the nodes available, but this could be used to either co-locate or seperate processes running different applications within the workload.

Compiled executables can be run with `ProcessGroup` by setting the processes `target` to the path on the filesystem of the executable.

**2_dragon_tasks.py**
```python
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
    from socket import gethostname

    sleep(sleep_time)
    hostname = gethostname()
    tile_name = os.getenv('ZE_AFFINITY_MASK')
    
    print(f"Hello from {hostname} on tile {tile_name}", flush=True)

if __name__ == '__main__':
    # Set the start method for multiprocessing to 'dragon'
    # This allows Dragon to manage process creation and affinity
    # This also allows for process launching across multiple nodes with the multiprocessing api
    set_start_method("dragon")

    # Number of processes to run in Pool and ProcessGroup
    alloc = System()
    num_procs_per_node = 12
    num_nodes = int(alloc.nnodes)
    num_procs = num_procs_per_node * num_nodes

    # Test 1:
    # Distribute tasks across availble cores with a simple pool
    # Unlike standard multiprocessing, Dragon will launch pool processes across multiple nodes
    # This pool does not use any GPU affinity
    print("Launching tasks with a simple Pool, no GPU affinity...", flush=True)
    sleep_times = np.ones(num_procs) * 10.0  # Sleep for 1 second each
    with Pool(num_procs) as p:
        results = p.map(hello_gpu_affinity, sleep_times)

    # Test 2:
    # Now distribute tasks with a Policy and ProcessGroup
    # This will launch processes across nodes with specific CPU and GPU affinities
    print("\nLaunching tasks with CPU and GPU affinities with a ProcessGroup...", flush=True)
    run_dir = os.getcwd()
    nodelist = alloc.nodes

    # Create a ProcessGroup
    pg = ProcessGroup(pmi_enabled=False) # To run an application with mpi, set pmi_enabled=True

    # Assign processes to nodes with specific CPU and GPU affinities
    for node in nodelist:
        node_name = Node(node).hostname
        for proc in range(num_procs_per_node):
            local_policy = Policy(placement=Policy.Placement.HOST_NAME,
                                  host_name=node_name,
                                  cpu_affinity=cpu_affinities[proc],
                                  gpu_affinity=gpu_affinities[proc])
            pg.add_process(nproc=1, 
                        template=ProcessTemplate(target=hello_gpu_affinity, # to run a compiled appication, set target to the path of compiled executable
                                                    args=(10.0,), # sleep time
                                                    cwd=run_dir,
                                                    policy=local_policy,))
    
    pg.init()
    pg.start()

    pg.join()
    pg.close()
```
## Submitting to PBS

To submit these tests to multiple nodes with PBS, use the following submit script:

```shell
qsub 3_submit_multinode.sh
```

**3_submit_multinode.sh**
```bash
#!/bin/bash -l
#PBS -A ATPESC2025
#PBS -l select=2
#PBS -N task_launching_test
#PBS -l walltime=0:10:00
#PBS -l filesystems=home:flare
#PBS -k doe
#PBS -l place=scatter
#PBS -q ATPESC

cd $PBS_O_WORKDIR

module load frameworks
conda activate /flare/ATPESC2025/EXAMPLES/track3-workflows/_demo_env

echo "Running parsl test"
python ./1_parsl_tasks.py

echo ""
echo "Running dragon test"
dragon ./2_dragon_tasks.py
```