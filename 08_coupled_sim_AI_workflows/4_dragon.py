"""Active learning loop for molecule discovery with Dragon. Data is moved via Dragon DDict.

The workflow searches a large library of candidate molecules for high ionization
energy (IE). Because a first-principles IE calculation is expensive, we couple
an inexpensive surrogate model with a small batch of real simulations at each
iteration of an active-learning loop:

    1. Collect training data by running several xtb simulations.
    2. Fine-tune a linear regression head on top of the frozen MoLFormer-XL
       SMILES encoder using the (SMILES, IE) pairs gathered so far.
    3. Run the fine-tuned model over the full search space to predict IE for
       every candidate.
    4. Pick the top-k predicted molecules, simulate them for real, and add
       the results to the training set.
    5. Repeat 2-4 until we've simulated the target number of molecules.

Dragon orchestrates the loop across a heterogeneous Aurora node: xtb simulations
run as CPU apps using a Dragon Pool while MoLFormer training and
inference run as GPU apps launched with Process and ProcessGroup. 
Each app reads inputs and returns results through the DDict or through Dragon's
mp.Queue. On multi-node runs, both DDict and Queue operations can leverage 
RDMA based communication for faster transfers.
"""

import os
from time import perf_counter
import pandas as pd
import numpy as np
import random
import sys

import dragon
import multiprocessing as mp
from dragon.data.ddict import DDict
from dragon.native.machine import System, Node
from dragon.native.pool import Pool as DragonPool

from utils.parsl_config import aurora_gpu_config
from chemfunctions import _compute_vertical as compute_vertical
from utils.utils import plot_best_molecules

# ~~~ Ensure the MoLFormer model weights are visible
assert os.environ.get("MOLFORMER_WEIGHTS_DIR"), \
    "set MOLFORMER_WEIGHTS_DIR to the local MoLFormer snapshot dir"

# ~~~ Set the random seed for reproducibility on the sample selection
seed = 42
np.random.seed(seed)
random.seed(seed)

# ~~~ Define parameters for the workflow
initial_training_count = 32  # Number of trianing samples to collect for first model training
max_training_count = 64  # Maximum number of training samples to collect for training
batch_size = 16  # Number of molecules to simulate in each iteration of active learning loop
if initial_training_count >= max_training_count:
    print("Must do at least 1 active trianing iteration.")
    print("Change the values of initial_training_count and/or max_training_count and try again.")
    sys.exit(1)

# ~~~ Define Python apps for each step in the workflow
# Simulation app to compute the ionization energy of a molecule 
compute_vertical_app = compute_vertical

# Model training app 
def train_model_app():
    import torch
    from models.molformer import fit_model

    # Attach to the DDict
    dd = mp.current_process().stash["ddict"]

    batch = dd["batch"]
    model_output = fit_model(dd["train_data"])
    dd[f"model_state_{batch}"] = {
        "state_dict": model_output["state_dict"],
        "y_mean": model_output["y_mean"],
        "y_std": model_output["y_std"],
    }
    return model_output["time"]

# Inference app to run the model on a chunk of SMILES
def inference_app(proc_id):
    import torch
    import pandas as pd
    from models.molformer import predict_model

    # Attach to the DDict
    dd = mp.current_process().stash["ddict"]

    batch = dd["batch"]
    model_state = dd[f"model_state_{batch}"]
    smiles = dd[f"chunk_{proc_id}"].tolist()
    outputs = predict_model(model_state, smiles)
    dd[f"predictions_{proc_id}"] = outputs["predictions"]
    return outputs["time"]

# Setup function to stach the DDict at Pool init
def setup(dd: DDict):
    me = mp.current_process()
    me.stash = {}
    me.stash["ddict"] = dd

# ~~~ Search space of molecules to sample from
search_space = pd.read_csv('./data/QM9-search.tsv', sep=r'\s+')
search_space_size = len(search_space)


if __name__ == "__main__":
    # Mark when we started
    start_time = perf_counter()

    print(f"Will collect a maximum of {max_training_count} training samples for training.")
    print(f"Will run {batch_size} new simulations in each loop iteration to refine the model.\n")

    # ~~~ Set the mp start method
    mp.set_start_method("dragon")

    # ~~~ Get allocation info
    alloc = System()
    num_nodes = alloc.nnodes
    nodelist = alloc.nodes
    head_node = Node(nodelist[0])
    num_cores_per_node = head_node.num_cpus // 2 # limit to the physical cores of the node
    num_gpus_per_node = head_node.num_gpus
    print(
        f"Dragon running on {num_nodes} nodes, "
        f"each with {num_cores_per_node} cores and {num_gpus_per_node} GPU"
    )

    # ~~~ Initialize the DDict on all the nodes
    ddict_mem_per_node = 0.3 * head_node.physical_mem # dedicate 30% of each node's memory to the DDict
    tot_ddict_mem = int(ddict_mem_per_node * num_nodes)
    managers_per_node = 4
    dd = DDict(managers_per_node, num_nodes, tot_ddict_mem)
    print(f"Started DDict on {num_nodes} nodes with {tot_ddict_mem/1024/1024/1024:.1f} GB of memory\n",flush=True)

    # ~~~ Chunk the search space into smaller pieces and add those to the DDict
    num_chunks = min(num_nodes * num_gpus_per_node, len(search_space['smiles']))
    chunks = np.array_split(np.array(search_space['smiles']), num_chunks)
    for i, chunk in enumerate(chunks):
        dd[f"chunk_{i}"] = chunk

    # ~~~ Start with some random guesses of molecules to create initial training data
    init_mols = search_space.sample(initial_training_count)['smiles'].to_list()
    print(f"Sampled {initial_training_count}/{search_space_size} random molecules", flush=True)

    # ~~~ Launch the simulations with Dragon native Pool
    tic = perf_counter()
    num_workers = min(num_cores_per_node * num_nodes, initial_training_count)
    pool = DragonPool(num_workers)
    print(f'Submitted {initial_training_count} simulations ...', flush=True)
    results = pool.map_async(compute_vertical_app, init_mols).get()
    pool.close()
    pool.join()

    # ~~~ Generate the initial training data
    already_ran = set()
    train_data = []
    for i, result in enumerate(results):
        train_data.append({
            'smiles': init_mols[i],
            'ie': result,
            'batch': 0,
            'time': perf_counter() - start_time
        })
        already_ran.add(init_mols[i])
    train_data = pd.DataFrame(train_data)
    dd["train_data"] = train_data
    init_sim_time = perf_counter() - tic
    print(f"Initial training data collected in {init_sim_time:.2f} sec\n", flush=True)

    # ~~~ Active Learning Loop
    # Run training, inference, and simulation in a loop continuously until we've simulated enough molecules
    # Each successive batch of simulations should predict higher ionization energies
    print("Starting active learning loop\n", flush=True)
    batch = 1
    dd["batch"] = batch
    best_molecules = []
    model_accuracy = []
    while len(train_data) <= max_training_count:
        start_loop_time = perf_counter()
        print(f"Iteration {batch}:")

        # Train on subset of molecules
        tic = perf_counter()
        pool = DragonPool(policy=System().gpu_policies(), # launches one process per GPU, binding each process to a single GPU
                      processes_per_policy=1, 
                      initializer=setup, 
                      initargs=(dd,)
        )
        model_fit_time = pool.apply_async(train_model_app).get()
        pool.close()
        pool.join()
        t_train = perf_counter() - tic
        print(
            f"\tTrained on {len(train_data)} molecules:\n"
            f"\t\ttotal time: {t_train:.2f} sec\n",
            f"\t\tfit_model time: {model_fit_time:.2f} sec", 
            flush=True
        )

        # Inference on all molecules (divided into chunks)
        tic = perf_counter()
        chunk_id = [i for i in range(num_chunks)]
        pool = DragonPool(policy=System().gpu_policies(), # launches one process per GPU, binding each process to a single GPU
                        processes_per_policy=1, 
                        initializer=setup, 
                        initargs=(dd,)
        )
        model_pred_times = pool.map_async(inference_app, chunk_id).get()
        pool.close()
        pool.join()
        predictions = pd.concat([dd[f"predictions_{i}"] for i in chunk_id], ignore_index=True)
        t_inf = perf_counter() - tic
        model_pred_time = sum(model_pred_times) / len(model_pred_times)
        print(
            f"\tPredicted {search_space_size} molecules:\n",
            f"\t\ttotal time: {t_inf:.2f} sec\n",
            f"\t\tpredict_model time: {model_pred_time:.2f} sec", 
            flush=True
        )
        
        # Sort inference predictions and store best molecules
        predictions.sort_values('ie', ascending=False, inplace=True)
        for i in range(5):
            best_molecules.append({
                    'smiles': predictions['smiles'].iloc[i],
                    'ie': predictions['ie'].iloc[i],
                    'batch': batch,
                    'time': perf_counter() - start_time
            })
        print(f"\tBest predicted molecule: {predictions['smiles'].iloc[0]} with ionization energy {predictions['ie'].iloc[0]:.2f} Ha", flush=True)
        
        # Submit new simulations for the top predictions
        tic = perf_counter()
        num_workers = min(num_cores_per_node * num_nodes, initial_training_count)
        new_sims = []
        for smiles in predictions['smiles']:
            if smiles not in already_ran:
                new_sims.append(smiles)
                already_ran.add(smiles)
                if len(new_sims) >= batch_size:
                    break
        
        pool = DragonPool(num_workers)
        results = pool.map_async(compute_vertical_app, new_sims).get()
        pool.close()
        pool.join()

        new_results = []
        for i, result in enumerate(results):
            new_results.append({
                'smiles': init_mols[i],
                'ie': result,
                'batch': 0,
                'time': perf_counter() - start_time
            })
        t_sim = perf_counter() - tic
        new_results = pd.DataFrame(new_results)
        print(f"\tSimulated {len(new_results)} new molecules in {t_sim:.2f} sec", flush=True)
        
        # Update the training data
        train_data = pd.concat((train_data, new_results), ignore_index=True)
        dd["train_data"] = train_data
        
        # Compute model error estimate 
        error = 0.
        for smiles in train_data['smiles']:
            true_ie = train_data[train_data['smiles'] == smiles]['ie'].iloc[0]
            predicted_ie = predictions[predictions['smiles'] == smiles]['ie'].iloc[0]
            error += abs(true_ie - predicted_ie) / true_ie
        error /= len(train_data)
        model_accuracy.append({
            'batch': batch,
            'error': error,
        })
        print(f"\tEstimate of MoLFormer Model Mean Relative Error (MRE): {error:.2f} %", flush=True)
           
        # Repeat
        batch += 1
        dd["batch"] = batch
        print(f"\tFinished loop iteration in {(perf_counter() - start_loop_time):.2f}s\n", flush=True)
        
    end_time = perf_counter()
    print(f"Training completed in {(end_time - start_time):.2f} seconds")
        
    # ~~~ Plot results of active learning loop
    print("\nPlotting results...")
    best_molecules = pd.DataFrame(best_molecules)
    model_accuracy = pd.DataFrame(model_accuracy)
    plot_best_molecules(best_molecules, batch)
    
    # ~~~ Save results
    train_data.to_csv('training_data.csv', index=False)
    best_molecules.to_csv('best_molecules.csv', index=False)
    print("All done!", flush=True)
