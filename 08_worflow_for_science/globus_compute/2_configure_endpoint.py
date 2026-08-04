from globus_compute_sdk import Executor
from globus_compute_sdk.serialize import ComputeSerializer, AllCodeStrategies
from concurrent.futures import as_completed

# Run from an Aurora UAN against the Polaris MEP.
#
# Unlike a single-user endpoint (which is configured once with a yaml file),
# a MEP user endpoint is configured at *submit time* through the
# user_endpoint_config dictionary.  This example shows the common knobs and
# how they affect where and how your functions run.

POLARIS_MEP = "9a947ba5-f537-4681-acf3-cc66485aadec"
ACCOUNT = "ATPESC2026"
QUEUE = "ATPESC"


def where_am_i(task_id, sleeptime):
    import os
    import socket
    import time

    start = time.time()
    time.sleep(sleeptime)
    return (f"task {task_id:>2} ran on {socket.gethostname()} "
            f"(pid {os.getpid()}) for {time.time() - start:.1f}s")


if __name__ == "__main__":
    serializer = ComputeSerializer(strategy_code=AllCodeStrategies())

    # Each key below maps to a documented Polaris MEP configuration option.
    user_endpoint_config = {
        # Required: project to charge and queue to submit to
        "account": ACCOUNT,
        "queue": QUEUE,
        # Walltime of the PBS job the MEP submits on your behalf
        "walltime": "00:10:00",
        # One PBS job (block) of a single node
        "nodes_per_block": 1,
        # Allow up to 4 functions to run concurrently on the node
        "max_workers_per_node": 4,
        # Shut the PBS job down after 60s idle so you don't burn allocation
        "max_idletime": 60,
        # Polaris-visible filesystems.  NOTE: the MEP runs on Polaris, which
        # cannot see Aurora's /flare filesystem -- use home/eagle/grand.
        "scheduler_options": "#PBS -l filesystems=home:eagle:grand",
    }

    with Executor(endpoint_id=POLARIS_MEP,
                  serializer=serializer,
                  user_endpoint_config=user_endpoint_config) as gce:

        # Submit 8 tasks to 4 workers -> the node runs two waves of 4.
        # Watch the reported durations to see the second wave start after the
        # first finishes.
        futures = [gce.submit(where_am_i, i, 5) for i in range(8)]

        print("Submitted 8 tasks to a 4-worker node, waiting for results...")
        for f in as_completed(futures):
            print(f.result())
