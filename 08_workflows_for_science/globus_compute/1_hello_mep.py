from globus_compute_sdk import Executor
from globus_compute_sdk.serialize import ComputeSerializer, AllCodeStrategies

# This script is intended to be run from an Aurora login node (UAN) as the
# client.  It sends a function to the facility-supported Polaris multi-user
# endpoint (MEP), which runs the function on a Polaris compute node.

# The Polaris MEP is already running as a facility service -- there is no
# endpoint for you to configure or start.  You only need its UUID.
POLARIS_MEP = "9a947ba5-f537-4681-acf3-cc66485aadec"

# Project and queue used to charge and schedule the PBS jobs the MEP submits
# on your behalf.
ACCOUNT = "ATPESC2026"
QUEUE = "ATPESC"


# A simple function that reports the environment it runs in on Polaris.
# This is a useful first test when checking that the MEP is reachable.
def hello_affinity():
    import sys
    import os
    import socket
    import parsl
    import globus_compute_endpoint

    return f""" Hello Aurora! I'm Polaris! Here's some of my info:
                hostname: {socket.gethostname()}
                remote environment: {sys.executable}
                python version: {sys.version}
                parsl version: {parsl.__version__}
                GCE version: {globus_compute_endpoint.__version__}
            """

# The AllCodeStrategies serializer avoids serialization errors 
# when the client (Aurora) and the MEP workers (Polaris, python 3.13) 
# run different python versions.
serializer = ComputeSerializer(strategy_code=AllCodeStrategies())

# user_endpoint_config is passed to the MEP, which uses it to provision a
# user endpoint (UEP) that submits PBS jobs under your account.  "account"
# and "queue" are always required.
gce = Executor(
    endpoint_id=POLARIS_MEP,
    serializer=serializer,
    user_endpoint_config={
        "account": ACCOUNT,
        "queue": QUEUE,
    },
)

print("Submitting hello_affinity to the Polaris MEP, waiting for result...")
future = gce.submit(hello_affinity)
print(future.result())

gce.shutdown()
