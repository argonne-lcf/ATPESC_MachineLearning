import parsl
import os
from parsl.config import Config
from parsl import bash_app
# PBSPro is the right provider for aurora:
from parsl.providers import PBSProProvider
# The MPIExecutor is for running MPI applications:
from parsl.executors import MPIExecutor
# Use the Simple launcher
from parsl.launchers import SimpleLauncher
from parsl.addresses import address_by_interface

# We will save outputs in the current working directory
working_directory = os.getcwd()

# Set your queue, account and environment
queue = "ATPESC"
account = "ATPESC2026"
load_env = f"source {working_directory}/../0_activate_preinstall.sh"

config = Config(
    executors=[
        MPIExecutor(
            # hsn0 is Aurora's Slingshot network interface
            address=address_by_interface('hsn0'),
            max_workers_per_block=2,  # Assuming 2 nodes per task
            provider=PBSProProvider(
                account=account,
                worker_init=f"""{load_env};
                                export TMPDIR=/tmp;
                                cd {working_directory}""",
                walltime="00:10:00",
                queue=queue,
                scheduler_options="#PBS -l filesystems=home:flare",
                launcher=SimpleLauncher(),
                select_options="",
                nodes_per_block=2,
                max_blocks=1,
                cpus_per_node=208,
            ),
        ),
    ]
)

resource_specification = {
  'num_nodes': 2,        # Number of nodes required for the application instance
  'ranks_per_node': 12,  # Number of ranks / application elements to be launched per node (1 per GPU tile)
  'num_ranks': 24,       # Number of ranks in total
}

@bash_app
def mpi_hello_affinity(parsl_resource_specification, depth=8, stdout='mpi_hello.stdout', stderr='mpi_hello.stderr'):
    # PARSL_MPI_PREFIX will resolve to `mpiexec -n 24 -ppn 12 -hosts NODE001,NODE002`
    APP_DIR = "/flare/ATPESC2026/EXAMPLES/track-6-workflows-for-science/GettingStarted"
    # wrap application with set_affinity_gpu.sh to set GPU tile affinity; see HelperScripts/Aurora for details
    return f"$PARSL_MPI_PREFIX --cpu-bind depth --depth={depth} \
            {APP_DIR}/HelperScripts/Aurora/set_affinity_gpu.sh {APP_DIR}/Examples/Aurora/affinity_gpu/sycl/hello_affinity"

with parsl.load(config):
    tasks = []
    for i in range(4):
        tasks.append(mpi_hello_affinity(parsl_resource_specification=resource_specification,
                                        stdout=f"{working_directory}/mpi_output/hello_{i}.stdout",
                                        stderr=f"{working_directory}/mpi_output/hello_{i}.stderr"))

    # Wait on futures to return, and print results
    for i, t in enumerate(tasks):
        t.result()
        with open(f"{working_directory}/mpi_output/hello_{i}.stdout", "r") as f:
            print(f"Stdout of task {i}:")
            print(f.read())
