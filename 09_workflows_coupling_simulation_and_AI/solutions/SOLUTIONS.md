# Solutions to Hands-On Exercises on Active Learning Workflow

1. **To start, estimate how long it would take to run xTB simulations of all molecules in the QM9 dataset on 2 and 16 nodes of Aurora.**

Execute `python 1_simulate_molecules.py` and note how many molecules are simulated, the time taken to simulate them, and how many cores the simulations are run on based on the Parsl config. Note the script uses the CPU config, which defines the number of workers per node as 102, which is the number of CPU cores on Aurora nodes (excluding 0 and 52 which are reserved for the OS). The script randomly selects 1020 molecules to simulate, which on 2 nodes involves refilling the workers 5 times, thus the runtime measure is a fairly accurate measure of the steady-state throughput.

On two nodes using all available cores, simulating 1020 molecules with Parsl takes approximately 18 seconds (run-to-run variability is expected so consider these approximations). We then calculate the throughput as 1020 / (102 x 2) / 18 = 0.278 molecules per second per core. Then, the estimated time to simulate all 130,258 molecules in the QM9 dataset is computed as t = 130,258 / (0.278 x 102 x num_nodes) seconds. 

It takes about 38 minutes on 2 nodes and just under 5 minutes on 16 nodes. Not too expensive for this small dataset.

2. **How long would it take to simulate the ZINC22 datasets containing ~5 billion molecules on all of Aurora?**

Using the same equation as above and assuming all 10,624 nodes of Aurora are available, it would take 4 hours 37 minutes to simulate 5 billion molecules (almost 50,000 node hours)! Brute-force simulation is indeed prohibitively expensive for large datasets.

3. **Based on the logs of the `2_parsl_futures.py` script, which components of the workflow take the longest? Why?**

Excluding the first loop iteration which involves warm-up overhead, inference is the slowest component of the loop followed by training. The simulation component takes a small fraction of the iteration time (3--4 seconds).

Both training and inference components show a significant time spent on the workflow overhead instead of doing the actual computation. This is particularly true for inference, for which the workflow overhead when running on 2 nodes is around 66 seconds compared to the 1.5 seconds required to infer on the full dataset.

The reason for this overhead is due to the fact that both the model weights (~170MB) and the chunked SMILES are passed through Parsl's infrastructure every time training and inference workers are launched. Under the hood, each `python_app` submission pickles its arguments on the driver, sends them via ZeroMQ over TCP to the Parsl interchange process, which forwards them again over ZeroMQ to a per-node manager process, which finally hands them to the target worker via a local `multiprocessing.Queue` which unpickles them. During inference, the pickled weights are sent to 12 workers per node, and across nodes via slow TCP transfers. This is where most of the overhead comes from. 

Fun fact, the MolFormer surrogate is more than 10,000 times faster than the simulation in this case! 

4. **To get around sending large datasets through the Parsl infrastructure, we can modify the Parsl apps to pass the model weights and chunked smiles for inference through the disk. Modify the `train_model_app` and `inference_app` functions, as well as the loop writing the SMILES chunks to disk, to exchange data through Lustre then run the script.**

See the implementation in [3_parsl_io_sol.py](./3_parsl_io_sol.py). Some faster I/O solutions for Pandas Dataframes are possible (e.g., using `.to_parquet("file.parquet", engine="pyarrow")` and `pd.read_parquet()` with the `pyarrow` package), however the `.to_pickle` and `pd.read_pickle()` approach is sufficient in this case.

5. **What is the workflow overhead now for the training and inference components?**

The [3_parsl_io_sol.py](./3_parsl_io_sol.py) implementation reduces the workflow overhead to less than 1 second for both training and inference. On 2 nodes and writing files to Lustre, ~0.2 seconds overhead for training and ~0.4 seconds overhead for inference can be observed.

6. **What can we expect from this data movement approach as the scale of the data and number of workers increases?**

Possible bottlenecks we can encounter as we scale up the data size and the number of workers and nodes are: 

* Lustre metadata server contention reading model weights from many inference workers or writing many chunked SMILES files
* Use of node-local memory or storage (e.g., tmpfs on Aurora and SSDs on Polaris) might avoid Lustre problems and provide larger bandwidth, but would need something like `bcast` to move model weights to all the nodes. SMILES chunks would also have to be distributed to the appropriate nodes.
* As the search space grows to a few billion molecules, the driver can run out of memory loading the entire search space. The workflow would need to use a pre-chunked search space not just for inference inputs, but also for the outputs, requiring additional I/O when sorting and sampling molecules for the data acquisition step. 

7. **Now let’s look at the Dragon implementation, here we make use of the DDict to store model weights and SMILES in memory to avoid IO to Lustre. Modify the train_model_app and inference_app functions, as well as the loop over SMILES chunks, to exchange data through the DDict then run the script.**

See the implementation in [4_dragon_sol_1.py](./4_dragon_sol_1.py).

8. **Why is the workflow overhead for the training and inference components larger than the Parsl I/O case? What can we do to reduce this overhead?**

The workflow overhead is large because we are creating a new Pool and launching *new* workers for each component of the workflow, meaning that we always incur the cost of launching the worker processes. The Parsl implementation initializes the workers only once since the entire workflow is under the same `with parsl.load(aurora_gpu_config):` context. 

Note that the reported `fit_model` and `predict_model` times are also larger. This is due to the fact that since we create new workers for each component, these have to initialize the MoLFormer tokenizer and encoder each time, adding overhead that is otherwise only seen during the first iteration of the AL loop.

The solution is to initialize the Pool before we launch any work, as done in [4_dragon_sol_2.py](./4_dragon_sol_2.py). Now the workflow overhead reduces to less than 1 second as well.
