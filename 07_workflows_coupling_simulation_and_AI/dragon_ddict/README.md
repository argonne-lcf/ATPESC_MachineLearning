# AI-in-the-loop workflow with DragonHPC

## Introduction
This is an example of how DragonHPC can be used to execute a workflow which combines ML training, inference, and simulation. 
This demo was adapted from DragonHPC's documentation, specifically their [AI-in-the-loop example](https://dragonhpc.github.io/dragon/doc/_build/html/cbook/ai-in-the-loop.html), however it was modified to run all components in Python and to leverage the Distributed Dictionary (DDict) feature in order to stage and share both training and inference data on the node memory, thus avoiding writing to the parallel file system. 
The DDict is a sharded dictionary object which offers key/value store distributed across nodes, with Python and C++ clients for utilization from most AI and simulation workloads.
More information on the DDict can be found in the [documentation](https://dragonhpc.github.io/dragon/doc/_build/html/ref/data/dragon.data.DDict.html).

In this example, a small model implemented in PyTorch is used to train a surrogate for the simple sine function (y=sin(x)) in the interval [-pi,pi].
The workflow uses an "expensive" MPI simulation (`sim-expensive.py`) to compute training data for the sine function and performs initial training on this data.
This is followed by a fine-tuning loop, in which:

* Inference data is drawn randomly in the interval [-pi,pi]
* The model's accuracy is evaluated by *concurrently* performing inference and running a "cheap" MPI simulation (`sim-cheap.py`). Inference is run on the GPU if available, while the cheap simulation is run in parallel on the CPU. An error metric is computed from the model predictions and the cheap simulation results. 
* Based on the error and tolerance set, the workflow either performs fine-tuning by generating more data with the expensive simulation or draws more random data for additional evaluation.
* The workflow stops after 5 successful model evaluations or 10 fine-tuning attempts.

Thanks to the DDict, all the data produced and shared between training, inference, and the two simulations is stored on the nodes' memory, thus avoiding the file system entirely. 

Note that due to some issues with launching multiple MPI jobs on Aurora with DragonHPC's native ProcessGroup, the exmaple is set to run the MPI simulations on a single rank. On Polaris, the simulations run with 4 MPI processes per node. 
Additionally, ML training and inference are set to run on the GPU on Aurora and Polaris, however, due to the small size of the model and data, only a single GPU is sufficient on either system. The example can easily be extended to run multiple inference instances or perform distributed training.

The example contains the following files:
* `0_activate_env.sh` - A script to activate pre-built environment
* `1_ai-in-the-loop.py` - This file contains the workflow driver `main` function. It also contains functions for launching both MPI simulations and evaluating the model.
* `model.py` - This file defines the model and provides some functions for model training and inference. 
* `sim-expensive.py` - This contains what we are considering the expensive MPI simulaiton. It computes (x, sin(x)) data points that are used to train the model.
* `sim-cheap.py` - This is the cheap approximation. It computes the Taylor approximation of sin(x). 

## Installation 

For the workshop, there is an environment pre-built that you can activate with the necessary software for this demo.

```shell
module load frameworks
. /flare/ATPESC2025/EXAMPLES/track3-workflows/_dragon_env/bin/activate
```

DragonHPC can be installed on Polaris and Aurora on top of the default ML frameworks modules.

For Aurora, execute

```
module load frameworks

python -m venv _dragon_env --system-site-packages
. _dragon_env/bin/activate
pip install dragonhpc==0.12
dragon-config add --ofi-runtime-lib=/opt/cray/libfabric/1.22.0/lib64
```

For Polaris, execute
```
module use /soft/modulefiles
module load conda
conda activate base

python -m venv _dragon_env --system-site-packages
. _dragon_env/bin/activate
pip install dragonhpc==0.12
dragon-config add --ofi-runtime-lib=/opt/cray/libfabric/1.15.2.0/lib64
```

The `dragon-config` command run with the installation tells `dragon` how to use the slingshot network and enables `dragon` RDMA transfers.

## Run Instructions

To run the example on either Polaris or Aurora, first load the default ML frameworks module and source the Python virtual environment as shown in the installation instructions above.
Then, execute

```
python -m dragon 1_ai-in-the-loop.py
```

## Example Output

The following is an example of the output obtained by running the workflow on Aurora.

```
DragonHPC running on 1 nodes:
['x4710c1s7b0n0']

Head node is x4710c1s7b0n0, with:
    num cpus: 208
    num gpus: 12
    device type: xpu
    memory: 1134.4 GB

Training model ...
Training loss = 1.956

ML prediction error is 0.370, above tolerance!
Launching more training ...
Training loss = 0.036

ML prediction error is 0.147, above tolerance!
Launching more training ...
Training loss = 0.012

ML prediction error is 0.109, above tolerance!
Launching more training ...
Training loss = 0.005

ML prediction error is 0.036, below tolerance!

ML prediction error is 0.037, below tolerance!

ML prediction error is 0.037, below tolerance!

ML prediction error is 0.047, below tolerance!

ML prediction error is 0.045, below tolerance!
```
