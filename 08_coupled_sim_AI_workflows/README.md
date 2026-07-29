# Active Learning Workflow for Molecular Design 

This example demonstrates a simple molecular design application combining simulations with machine learning (ML) training and inference. The objective is to efficiently identify molecules with the largest ionization energies from a large dataset of potential candidates. 

The example was adapted from an [ExaWorks demo](https://github.com/ExaWorks/molecular-design-parsl-demo/tree/main) developed by Logan Ward, ANL, and later modified by Christine Simpson, ANL. 

The ionization energy (IE) of a molecule is the amount of energy required to remove one electron from the molecule in its ground state to produce a positively charged ion. 
IE can be computed using various simulation packages, here we use [xTB](https://xtb-docs.readthedocs.io/en/latest/contents.html); however, execution of these simulations can be expensive, and thus, given a finite compute budget and a large set of molecules to screen, we must carefully select which molecules to explore by simulation. 
To help reduce the cost of screening large datasets of potential candidate molecules, we use machine learning, specifically the MoLFormer (add model info here), to predict the IE of molecules based on previously simulated data. 
We then employ an iterative process often called [active learning](https://pubs.acs.org/doi/abs/10.1021/acs.chemmater.0c00768) (AL) to simulate the best identified compounds and retrain the MolFormer model to improve the accuracy of predictions. 
A schematic of the active learning, or ML-in-the-loop, workflow is shown below.

![workflow](../figures/workflow.svg)

For this example, we use [Parsl](https://github.com/Parsl/parsl) to execute functions (simulation, model training, and inference) in parallel. Parsl allows us to establish dependencies in the workflow and to execute the workflow on arbitrary computing infrastructure, from laptops to supercomputers. We show how Parsl's integration with Python's native concurrency library (i.e., [`concurrent.futures`](https://docs.python.org/3/library/concurrent.futures.html#module-concurrent.futures)) lets you write applications that dynamically respond to the completion of asynchronous tasks.


Finally, we build the full active learning workflow (see [3_ml_in_the_loop.py](./3_ml_in_the_loop.py)), which uses the ML model to pick a batch of simulations, runs the simulations in parallel, and then uses the data to retrain the model before repeating the loop.

Our application uses `train_model_app`, `inference_app`, and `combine_inferences` as above, but after running an iteration, it picks the predicted best molecules and runs the `compute_vertical_app` to run the xTB simulation on those top candidates.  The workflow then repeatedly retrains the model using these results until a pre-determined number of simulations have been trained. 

The workflow is initialized with the following parameters, which determine how much data is to be generated via simulation for pre-training of the KNN model, the maximum size of the training dataset (thus also the maximum number of simulations to perform), and how many new simulations to perform and training data points to generate for each active learning iteration. These parameters strike a balance between pre-training and fine-tuning the model and can influence the accuracy of the model.

```python
# Define parameters for the workflow
initial_training_count = 256  # Number of training samples to collect for first model training
max_training_count = 512  # Maximum number of training samples to collect for training
batch_size = 64  # Number of molecules to simulate in each iteration of active learning loop
```

To check the performance of the active learning loop, the script outputs useful information for each iteration to the terminal and, after terminating the loop, generates a plot of the best identified molecules over loop iteration and run time. These logs and plots will be useful for the homework problem.

## Run Instructions

1. Submit an interactive job requesting 2 nodes (1 node is also okay):

    ```bash
    qsub -I -A ATPESC2026 -q ATPESC -l select=2 -l walltime=01:00:00 -l filesystems=home:flare
    ```

2. Source the environment provided:

    ```bash
    source 0_activate_env.sh
    ```

3. Simulate a large number of molecues with Parsl:

    ```bash
    python 1_simulate_molecules.py
    ```

4. Run the Parsl workflow script moving data through futures

    ```bash
    python 2_parsl_futures.py
    ```

5. Run the Parsl workflow script moving data through disk

    ```bash
    python 3_parsl_io.py
    ```

6. Run the Dragon workflow script moving data through the DDict

    ```bash
    dragon 4_dragon.py
    ```


## Improving the Active Learning Loop (Homework)

Some discussion of aquisition functions and how students can improve the performance of the AL loop by better selecting the next molecules to train...
