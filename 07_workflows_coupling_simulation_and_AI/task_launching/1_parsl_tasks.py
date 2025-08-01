# 0_parsl_tasks.py
import os
from parsl_config import aurora_single_tile_config
import parsl
from parsl.app.app import python_app, bash_app


# A simple app to execute native python code; this app reports the pinned GPU tile and sleeps
# To execute a compiled appication with Parsl, use the bash_app decorator
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

@bash_app
def hello_gpu_affinity_bash(sleep_time, 
                            stdout='tasks.out', 
                            stderr='tasks.err'):
    return f'echo "Hello from `hostname` on tile $ZE_AFFINITY_MASK"; sleep {sleep_time}'

# Open a context with the Config
with parsl.load(aurora_single_tile_config):
    
    # Run 12 tasks per node
    num_nodes = aurora_single_tile_config.executors[0].provider.nodes_per_block
    num_tasks = 12 * num_nodes
    print(f"Launching {num_tasks} tasks for each app on {num_nodes} nodes.")

    # Launch the tasks.
    py_futures = [hello_gpu_affinity_py(10) for i in range(num_tasks)]
    bash_futures = [hello_gpu_affinity_bash(10) for i in range(num_tasks)]   

    # Wait for all tasks to complete and print the results
    # Note that a parsl script must wait on task completion
    print("Output from python app tasks:")
    for future in py_futures:
        print(future.result())

    print("\nOutput from bash app tasks:")
    for future in bash_futures:
        future.result()
    with open('tasks.out', 'r') as f:
        print(f.read())
    print("All tasks completed.")
