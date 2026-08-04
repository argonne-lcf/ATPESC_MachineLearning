# Solutions to Hands-On Exercises on Active Learning Workflow

1. To start, estimate how long it would take to run xTB simulations of all molecules in the QM9 dataset on 2 and 16 nodes of Aurora.

Execute `python 1_simulate_molecules.py` and note how many molecules are simulated, the time taken to simulate them, and how many cores the simulations are run on based on the Parsl cofig. Note the script uses the CPU config, which defines the number of workers per node as 102, which is the number of CPU cores on Aurora nodes (excluding 0 and 52 which are reserved for the OS). The script randomly selects 1020 molecules to simulate, which on 2 nodes involves refilling the workers 5 times, thus the runtime measure is a fairly accurate measure of the 

On two nodes, running 1020 molecules takes approximately 18 seconds. We then calculate the throughput as 1020 / (102 x 2) / 18 = 0.278 molecules per second per core. Then, the estimated time to simulate all 130,258 molecules in the QM9 dataset is computed as t = 130,258 / (0.278 x 102 x num_nodes) seconds. 

It takes about 38 minutes on 2 nodes and just under 5 minutes on 16 nodes. Not too expensive for this small dataset.

2. How long would it take to simulate the ZINC22 datasets containing ~5 billion molecules on all of Aurora?

Using the same equation as above and assuming all 10,624 nodes of Aurora are available, it would take 4 hours 37 minutes to simulate 5 billion molecules (almost 50,000 node hours)! Brute-force simulation is indeed prohibitiely expensive for large datasets.

3. 


