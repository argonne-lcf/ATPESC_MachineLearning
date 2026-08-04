from globus_compute_sdk import Executor
from globus_compute_sdk.serialize import ComputeSerializer, AllCodeStrategies
from concurrent.futures import as_completed

# Run from an Aurora UAN against the Polaris MEP.
#
# By default the MEP runs functions with the SimpleLauncher on a single node.
# To spread work across multiple nodes, switch the launcher to MpiExecLauncher
# and request a multi-node block.  This example runs one function per node.

POLARIS_MEP = "9a947ba5-f537-4681-acf3-cc66485aadec"
ACCOUNT = "ATPESC2026"
QUEUE = "ATPESC"
NUM_NODES = 2


def query_host():
    import socket
    import time

    time.sleep(5)
    return f"Hello from node {socket.gethostname()}"


serializer = ComputeSerializer(strategy_code=AllCodeStrategies())

user_endpoint_config = {
    "account": ACCOUNT,
    "queue": QUEUE,
    # MpiExecLauncher is required to place workers across multiple nodes
    "launcher_type": "MpiExecLauncher",
    # Request a block spanning NUM_NODES nodes
    "nodes_per_block": NUM_NODES,
    # One worker per node so each function lands on its own node
    "max_workers_per_node": 1,
    # place=scatter is important for multi-node jobs: it spreads the job's
    # nodes across the machine.  Remember: Polaris filesystems only.
    "scheduler_options": (
        "#PBS -l filesystems=home:eagle:grand\n"
        "#PBS -l place=scatter"
    ),
}

with Executor(endpoint_id=POLARIS_MEP,
                serializer=serializer,
                user_endpoint_config=user_endpoint_config) as gce:

    # Two tasks per node.  With one worker per node they run one at a time
    # on each node, so you should see each hostname reported twice.
    futures = [gce.submit(query_host) for _ in range(2 * NUM_NODES)]

    print(f"Submitted {2 * NUM_NODES} tasks across {NUM_NODES} nodes, "
            "waiting for results...")
    for f in as_completed(futures):
        print(f.result())
