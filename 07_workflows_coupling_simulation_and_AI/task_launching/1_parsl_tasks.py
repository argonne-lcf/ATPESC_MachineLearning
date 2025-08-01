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
    futures = [hello_gpu_affinity_py(1) for i in range(num_tasks)]
    
    # Wait for all tasks to complete and print the results
    # Note that a parsl script must wait on task completion
    print("Output from python app tasks:")
    for future in futures:
        print(future.result())

    print("All tasks completed.")
