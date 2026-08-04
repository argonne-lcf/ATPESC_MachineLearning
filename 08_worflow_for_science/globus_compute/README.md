Globus Compute Multi-User Endpoints (MEPs)
===============================================

[Globus Compute](https://globus-compute.readthedocs.io/en/stable/index.html) lets you execute Python functions remotely by submitting them to endpoints running on ALCF systems.  This demo focuses on the **facility-supported multi-user endpoints (MEPs)**, which are persistent endpoints run by ALCF.

The key advantage of a MEP is that **you do not have to configure, start, or babysit an endpoint yourself.** 

In this demo, **the client runs on an Aurora login node (UAN)** and the functions run on **Polaris compute nodes** via the Polaris MEP.  The user could replace Aurora with any machine that has an HTTP connection (laptop, lab workstation, etc.).

Facility MEPs are currently offered on Polaris and Crux:

| System  | UUID |
| ------  | ---- |
| Polaris | [9a947ba5-f537-4681-acf3-cc66485aadec](https://app.globus.org/compute/endpoints/9a947ba5-f537-4681-acf3-cc66485aadec) |
| Crux    | [fd8b54bb-9452-411d-8e3a-09408156a886](https://app.globus.org/compute/endpoints/fd8b54bb-9452-411d-8e3a-09408156a886) |

The Globus pages linked above give up-to-date details on each endpoint's configuration template, schema, and status.  For full documentation see the [ALCF Globus Compute guide](https://docs.alcf.anl.gov/services/globus-compute/) and the [Globus Compute docs](https://globus-compute.readthedocs.io/en/stable/index.html).

# Setup

All of these scripts are **client** scripts: they run on an Aurora login node and only need the `globus_compute_sdk` (v4+).

Activate the tutorial environment:
```
source ../0_activate_preinstall.sh
```

## First-time authentication

The first time you contact the Globus service, you will be prompted to authenticate at the command line.  Copy the URL that appears into a web browser, select **Argonne LCF** from the organizations menu, and log in with your ALCF username and MobilePass+ code.  Globus will give you a token; paste it back at the command line to complete authentication.


## Serialization across python versions (important)

The Aurora client and the Polaris MEP workers (python 3.13) may run different python versions.  To avoid serialization errors (a `ManagerLost` error mentioning serialization), every script that submits a function uses the `AllCodeStrategies` serializer, which sends the full function source to the endpoint:

```python
from globus_compute_sdk.serialize import ComputeSerializer, AllCodeStrategies
serializer = ComputeSerializer(strategy_code=AllCodeStrategies())
gce = Executor(endpoint_id=..., serializer=serializer, user_endpoint_config=...)
```

## A note on filesystems (important)

The MEP runs your functions **on Polaris**, so any file paths your functions touch must live on a **Polaris-visible filesystem** — `home`, `eagle`, or `grand`.  **Polaris cannot see Aurora's `/flare` filesystem.**  This is why the `scheduler_options` in these scripts request `filesystems=home:eagle:grand` and the run directories live under `$HOME`.

# Exercises

## 1. Hello MEP (`1_hello_mep.py`)

The simplest possible test: submit a function that reports the hostname, python version, and package versions of the environment it lands in on Polaris.  Run this first to confirm your client can reach the MEP and that authentication works.

```bash
python 1_hello_mep.py
```

Because the MEP has to submit and start a PBS job on Polaris the first time, expect this to take a couple of minutes.  The result shows a Polaris compute-node hostname and the remote python/parsl/GCE versions.

```python
from globus_compute_sdk import Executor
from globus_compute_sdk.serialize import ComputeSerializer, AllCodeStrategies

POLARIS_MEP = "9a947ba5-f537-4681-acf3-cc66485aadec"
ACCOUNT = "ATPESC2026"
QUEUE = "ATPESC"

def hello_affinity():
    import sys, os, socket, parsl, globus_compute_endpoint
    return f""" Hello Aurora! I'm Polaris! Here's some of my info:
                hostname: {socket.gethostname()}
                remote environment: {sys.executable}
                python version: {sys.version}
                parsl version: {parsl.__version__}
                GCE version: {globus_compute_endpoint.__version__}
            """

serializer = ComputeSerializer(strategy_code=AllCodeStrategies())
gce = Executor(endpoint_id=POLARIS_MEP,
               serializer=serializer,
               user_endpoint_config={"account": ACCOUNT, "queue": QUEUE})
future = gce.submit(hello_affinity)
print(future.result())
```

Note that this function gives some useful information for creating python environments on the remote machine, if necessary.  If you wish to use your own python environment on the remote machine, it is necessary to install `parsl` and `globus-compute-endpoint`.  However, it is necessary to match the exact version of `parsl` in your remote environment with the version of `parsl` run by the MEP.  This convenient function gives you the `parsl` version run by the MEP.

## 2. Configuring the user endpoint (`2_configure_endpoint.py`)

A single-user endpoint is configured once with a yaml file.  A **MEP user endpoint is configured at submit time** through the `user_endpoint_config` dictionary.  This exercise walks through the common options and shows how they shape the PBS job the MEP submits for you:

| Key | Meaning |
|---|---|
| `account` / `queue` | project to charge and queue to submit to (**required**) |
| `walltime` | walltime of the PBS job the MEP submits |
| `nodes_per_block` | nodes per PBS job |
| `max_workers_per_node` | concurrent function executions per node |
| `max_idletime` | seconds an idle PBS job waits before shutting down |
| `scheduler_options` | extra `#PBS` lines (filesystems, placement, etc.) |

The script submits 8 tasks to a node with 4 workers, so the node runs two waves of 4.  Watch the reported task durations to see the second wave start after the first completes.

```bash
python 2_configure_endpoint.py
```

The full list of options and their defaults is in the [MEP configuration options](https://docs.alcf.anl.gov/services/globus-compute/#configuration-options) documentation.

## 3. Registering a function (`3_register_function.py`)

Globus Compute lets you **register** a function with the Globus service so it can be called later by a function id.  Registered functions can be shared, reused, and used as building blocks in [Globus Flows](https://docs.globus.org/api/flows/).

Registration talks only to the Globus service — no endpoint is contacted, so no account or queue is needed here.  We register the function's **source code** with `register_source_code` (rather than a pickled object) so it is robust to python-version differences between the Aurora client and the Polaris workers.  The function itself is a trivial `adder` that adds two numbers:

```python
from globus_compute_sdk import Client

source = '''
def adder(a, b):
    return a + b
'''

gcc = Client()
func_id = gcc.register_source_code(source=source,
                                   function_name="adder",
                                   description="Adds two numbers")
print(f"Registered adder; id {func_id}")
```

The same script then calls the registered function on the MEP by its id with `submit_to_registered_function`, and prints the result:

```python
future = gce.submit_to_registered_function(args=(5, 10), function_id=func_id)
print(f"5 + 10 = {future.result()}")
```

```bash
python 3_register_function.py
```

## 4. Wrapping a compiled executable (`4_wrap_executable.py`)

Globus Compute runs Python functions, but most HPC work is a compiled executable.  The pattern is to **wrap the executable in a Python function** that shells out to it with `subprocess`.  In this example the shell command `hostname; sleep <sleeptime>` stands in for the path to a real compiled executable.

```python
def host_sleep_wrapper(sleeptime):
    import os
    import subprocess

    command = f"hostname; sleep {sleeptime}"

    # Run in a directory on a Polaris-visible filesystem
    run_directory = "$HOME/atpesc_globus_mep"
    os.makedirs(os.path.expandvars(run_directory), exist_ok=True)
    os.chdir(os.path.expandvars(run_directory))

    res = subprocess.run(command, stdout=subprocess.PIPE,
                         stderr=subprocess.PIPE, shell=True)

    # Save stdout/stderr to the Polaris filesystem, and return them too
    with open("hello.stdout", "w") as f:
        f.write(res.stdout.decode("utf-8"))
    with open("hello.stderr", "w") as f:
        f.write(res.stderr.decode("utf-8"))

    if res.returncode != 0:
        raise Exception(f"Application failed with return code {res.returncode}")
    return res.returncode, res.stdout.decode("utf-8"), res.stderr.decode("utf-8")
```

The wrapper writes its output to a run directory on the Polaris filesystem and also returns stdout/stderr to the client.  A real command must live on a Polaris-visible filesystem (`home`, `eagle`, `grand`) — not Aurora's `/flare` — which is why the config requests `filesystems=home:eagle:grand`.

```bash
python 4_wrap_executable.py
```

## 5. Running across multiple nodes (`5_multinode.py`)

By default the MEP runs functions with the `SimpleLauncher` on a single node.  To spread work across nodes, switch to the `MpiExecLauncher` and request a multi-node block:

```python
user_endpoint_config = {
    "account": ACCOUNT,
    "queue": QUEUE,
    "launcher_type": "MpiExecLauncher",
    "nodes_per_block": 2,
    "max_workers_per_node": 1,
    "scheduler_options": "#PBS -l filesystems=home:eagle:grand\n#PBS -l place=scatter",
}
```

Note the `place=scatter` line, which is important for multi-node jobs so the block's workers are spread across nodes.  With one worker per node, the script submits two tasks per node (they run one at a time on each node), so you should see each Polaris compute-node hostname reported twice.

```bash
python 5_multinode.py
```

# Troubleshooting

## Runaway job submission

The most common pitfall is an endpoint that loops, queuing PBS jobs that immediately fail (for example, because of a bad `worker_init` or an unreachable filesystem).  Because the MEP runs your UEP under your account **on Polaris**, you stop it from Polaris:

```bash
# Login to Polaris (not Aurora) and remove the endpoint pid file(s)
ssh polaris.alcf.anl.gov
rm ~/.globus_compute/*/daemon.pid
```

This stops all PBS submissions made on your behalf.  To diagnose, inspect the PBS submit scripts and job logs the MEP created under `~/.globus_compute/<endpoint_name>/submit_scripts` on Polaris (MEP user endpoint names begin with `uep`).

## Serialization errors (`ManagerLost`)

A `ManagerLost` error mentioning serialization usually means the client and endpoint python versions differ.  These scripts already use the `AllCodeStrategies` serializer to avoid this; if you write your own, do the same.

# Running your own endpoints

Facility MEPs cover most common workloads, but they are only offered on some systems (currently Polaris and Crux) and expose a fixed set of configuration options.  If you need to run on a system without a MEP (for example, Aurora) or need options the MEP does not support, you can run your own **single-user endpoint** on a login node.  This means you install `globus-compute-endpoint`, write a config, and keep the endpoint process alive yourself — the operational burden the MEP otherwise handles for you.

The [ALCF Globus Compute repository](https://github.com/argonne-lcf/alcf-globus-compute) provides example config templates and instructions for running your own endpoints on ALCF systems.