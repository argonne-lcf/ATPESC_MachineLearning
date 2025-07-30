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