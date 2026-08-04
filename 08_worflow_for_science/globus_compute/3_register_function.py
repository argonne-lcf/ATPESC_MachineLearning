from globus_compute_sdk import Client, Executor
from globus_compute_sdk.serialize import ComputeSerializer, AllCodeStrategies

# Run from an Aurora UAN against the Polaris MEP.
#
# This example both REGISTERS a function with the Globus service and CALLS it
# on the MEP by its function id.
#
# Registration talks only to the Globus service (no endpoint, account, or
# queue needed).  A registered function is stored with the service and can be
# called later by its id -- registered functions are also the building blocks
# of Globus Flows.
#
# We register the function's *source code* (rather than a pickled object) so it
# is robust to python-version differences between the Aurora client and the
# Polaris MEP workers (python 3.13).

POLARIS_MEP = "9a947ba5-f537-4681-acf3-cc66485aadec"
ACCOUNT = "ATPESC2026"
QUEUE = "ATPESC"

source = '''
def adder(a, b):
    return a + b
'''

# Register the function with the Globus service and get back its id.
gcc = Client()
func_id = gcc.register_source_code(
    source=source,
    function_name="adder",
    description="Adds two numbers",
)
print(f"Registered adder; id {func_id}")

# Call the registered function on the Polaris MEP by its id.
serializer = ComputeSerializer(strategy_code=AllCodeStrategies())
gce = Executor(
    endpoint_id=POLARIS_MEP,
    serializer=serializer,
    user_endpoint_config={
        "account": ACCOUNT,
        "queue": QUEUE,
    },
)

print("Calling registered adder on the Polaris MEP, waiting for result...")
future = gce.submit_to_registered_function(args=(5, 10), function_id=func_id)
print(f"5 + 10 = {future.result()}")

gce.shutdown()
