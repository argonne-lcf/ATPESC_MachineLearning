from globus_compute_sdk import Executor
from globus_compute_sdk.serialize import ComputeSerializer, AllCodeStrategies

# Run from an Aurora UAN against the Polaris MEP.
#
# Globus Compute runs Python functions, but most HPC work is a compiled
# executable.  The pattern is to WRAP the executable in a Python function that
# shells out to it with subprocess.  Here the shell command "hostname; sleep"
# stands in for the path to a real compiled executable.

POLARIS_MEP = "9a947ba5-f537-4681-acf3-cc66485aadec"
ACCOUNT = "ATPESC2026"
QUEUE = "ATPESC"


def host_sleep_wrapper(sleeptime):
    import os
    import subprocess

    # Stand-in for a real executable.  A real command must live on a
    # Polaris-visible filesystem (/home, /eagle, /grand) -- NOT Aurora's
    # /flare, which Polaris cannot see.
    command = f"hostname; sleep {sleeptime}"

    # Create and move into a run directory on the Polaris filesystem
    run_directory = "$HOME/atpesc_globus_mep"
    os.makedirs(os.path.expandvars(run_directory), exist_ok=True)
    os.chdir(os.path.expandvars(run_directory))

    # Run the application command
    res = subprocess.run(command,
                         stdout=subprocess.PIPE,
                         stderr=subprocess.PIPE,
                         shell=True)

    # Save stdout/stderr to the Polaris filesystem for later inspection
    with open("hello.stdout", "w") as f:
        f.write(res.stdout.decode("utf-8"))
    with open("hello.stderr", "w") as f:
        f.write(res.stderr.decode("utf-8"))

    # Error handling: raise on failure, otherwise return the captured output
    if res.returncode != 0:
        raise Exception(f"Application failed with return code {res.returncode}: "
                        f"stderr='{res.stderr.decode('utf-8')}'")
    return res.returncode, res.stdout.decode("utf-8"), res.stderr.decode("utf-8")


if __name__ == "__main__":
    # The wrapper touches the Polaris filesystem, so request Polaris-visible
    # filesystems in the PBS job the MEP submits.
    serializer = ComputeSerializer(strategy_code=AllCodeStrategies())
    gce = Executor(
        endpoint_id=POLARIS_MEP,
        serializer=serializer,
        user_endpoint_config={
            "account": ACCOUNT,
            "queue": QUEUE,
            "scheduler_options": "#PBS -l filesystems=home:eagle:grand",
        },
    )

    print("Submitting host_sleep_wrapper to the Polaris MEP, waiting for result...")
    future = gce.submit(host_sleep_wrapper, 10)
    returncode, stdout, stderr = future.result()
    print(f"Results of wrapper function:\n{stdout}")

    gce.shutdown()
