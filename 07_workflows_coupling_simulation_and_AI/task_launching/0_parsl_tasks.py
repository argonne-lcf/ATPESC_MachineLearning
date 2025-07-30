# 0_parsl_tasks.py
import os
from parsl_config import aurora_single_tile_config
import parsl
from parsl.app.app import python_app, bash_app

# A simple app to execute a command line; this app reports the pinned GPU tile and sleeps
@bash_app
def hello_gpu_affinity_bash(sleep_time, stdout="hello_gpu_affinity.out", stderr="hello_gpu_affinity.err"):
    return f"sleep {sleep_time}; echo Hello from $HOSTNAME on tile $ZE_AFFINITY_MASK"

# A simple app to execute native python code; this app reports the pinned GPU tile and sleeps
@python_app
def hello_gpu_affinity_py(sleep_time):
    import os
    from time import sleep
    sleep(sleep_time)
    return f"Hello from {os.getenv('HOSTNAME')} on tile {os.getenv('ZE_AFFINITY_MASK')}"


with parsl.load(aurora_single_tile_config):
    
    # Make folder for output files
    os.makedirs("output", exist_ok=True)
    # Launch the tasks
    futures = [hello_gpu_affinity_bash(1, stdout=f"output/hello_{i}.out") for i in range(12)]

    # Wait for all tasks to complete and print results
    print("Output from bash apps:")
    for future in futures:
        future.result()
        with open(future.stdout, "r") as f:
            print(f.read().strip())

    # Launch the tasks
    futures = [hello_gpu_affinity_py(1) for i in range(12)]
    print("")
    print("Output from python apps:")
    for future in futures:
        print(future.result())

