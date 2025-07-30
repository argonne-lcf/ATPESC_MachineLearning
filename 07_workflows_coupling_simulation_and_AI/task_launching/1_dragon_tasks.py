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