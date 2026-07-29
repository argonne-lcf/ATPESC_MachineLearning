"""Active learning loop for molecule discovery with Parsl. Data is moved via Lustre.

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

Parsl orchestrates the loop across a heterogeneous Aurora node: xtb simulations
run as CPU apps on one HighThroughputExecutor while MoLFormer training and
inference run as GPU apps on another. Each app returns its result via an
AppFuture, and downstream apps that take those futures as arguments implicitly
form a dependency graph -- Parsl only launches a downstream task once its
inputs have resolved.
"""

import os
import parsl
from parsl.app.app import python_app
from time import perf_counter
from pathlib import Path
import pandas as pd
import numpy as np
from concurrent.futures import as_completed
import random
import sys

from utils.parsl_config import aurora_gpu_config
from chemfunctions import compute_vertical
from utils.utils import plot_best_molecules

# ~~~ Workflow run dir for IO
run_dir = Path.cwd().resolve()

# ~~~ Ensure the MoLFormer model weights are visible
assert os.environ.get("MOLFORMER_WEIGHTS_DIR"), \
    "set MOLFORMER_WEIGHTS_DIR to the local MoLFormer snapshot dir"

# ~~~ Set the random seed for reproducibility on the sample selection
seed = 42
np.random.seed(seed)
random.seed(seed)

# ~~~ Define parameters for the workflow
initial_training_count = 256  # Number of trianing samples to collect for first model training
max_training_count = 512  # Maximum number of training samples to collect for training
batch_size = 64  # Number of molecules to simulate in each iteration of active learning loop
if initial_training_count >= max_training_count:
    print("Must do at least 1 active trianing iteration.")
    print("Change the values of initial_training_count and/or max_training_count and try again.")
    sys.exit(1)

# ~~~ Define Parsl apps for each step in the workflow
# Simulation app to compute the ionization energy of a molecule 
compute_vertical_app = python_app(compute_vertical)

# Model training app 
@python_app(executors=["gpu"])
def train_model_app(train_data, weights_path):
    import torch
    from models.molformer import fit_model
    model_state = fit_model(train_data)
    torch.save(
        {
            "state_dict": model_state["state_dict"],
            "y_mean": model_state["y_mean"],
            "y_std": model_state["y_std"],
        },
        weights_path,
    )
    return model_state["time"]

# Inference app to run the model on a chunk of SMILES
@python_app(executors=["gpu"])
def inference_app(weights_path, chunk_path):
    import torch
    import pandas as pd
    from models.molformer import predict_model
    state = torch.load(weights_path, weights_only=True)
    # CSV variant: smiles = pd.read_csv(chunk_path)["smiles"].to_list()
    smiles = pd.read_pickle(chunk_path)["smiles"].to_list()
    return predict_model(state, smiles)

# ~~~ Search space of molecules to sample from
search_space = pd.read_csv('./data/QM9-search.tsv', sep=r'\s+')
search_space_size = len(search_space)

# ~~~ Chunk the search space into smaller pieces, so inference tasks run in parallel on chunked data
#gpu_executor = next(e for e in aurora_config.executors if e.label == "gpu")
gpu_executor = aurora_gpu_config.executors[0]
num_nodes = gpu_executor.provider.nodes_per_block  # number of nodes
num_workers_pn = gpu_executor.max_workers_per_node  # number of workers per node
num_chunks = min(num_nodes * num_workers_pn, len(search_space['smiles']))
chunks = np.array_split(np.array(search_space['smiles']), num_chunks)

# ~~~ Persist each SMILES chunk to disk 
chunk_paths = []
for i, chunk in enumerate(chunks):
    df = pd.DataFrame({"smiles": chunk})
    # CSV:
    # path = str(run_dir / f"smiles_chunk_{i}.csv")
    # df.to_csv(path, index=False)
    path = str(run_dir / f"smiles_chunk_{i}.pkl")
    df.to_pickle(path)
    # Can use to_parquet(engine="pyarrow") for faster IO
    chunk_paths.append(path)


if __name__ == "__main__":

    # ~~~ Load the Parsl configuration
    with parsl.load(aurora_gpu_config):

        # Mark when we started
        start_time = perf_counter()

        print(f"Will collect a maximum of {max_training_count} training samples for training.")
        print(f"Will run {batch_size} new simulations in each loop iteration to refine the model.\n")

        # ~~~ Start with some random guesses of molecules to create initial training data
        init_mols = search_space.sample(initial_training_count)['smiles']
        print(f"Sampled {initial_training_count}/{search_space_size} random molecules", flush=True)

        # ~~~ Launch the simulations with Parsl
        tic = perf_counter()
        sim_futures = [compute_vertical_app(mol) for mol in init_mols]
        print(f'Submitted {len(sim_futures)} simulations ...', flush=True)

        # ~~~ Generate the initial training data
        already_ran = set()
        train_data = []
        while len(sim_futures) > 0: 
            # First, get the next completed computation from the list
            future = next(as_completed(sim_futures))

            # Remove it from the list of still-running tasks
            sim_futures.remove(future)

            # Get the input 
            smiles = future.task_record['args'][0]
            already_ran.add(smiles)

            # Check if the run completed successfully
            if future.exception() is not None:
                # If it failed, pick a new SMILES string at random and submit it    
                smiles = search_space.sample(1).iloc[0]['smiles'] # pick one molecule
                new_future = compute_vertical_app(smiles) # launch a simulation in Parsl
                sim_futures.append(new_future) # store the Future so we can keep track of it
            else:
                # If it succeeded, store the result
                train_data.append({
                    'smiles': smiles,
                    'ie': future.result(),
                    'batch': 0,
                    'time': perf_counter() - start_time
                })
        train_data = pd.DataFrame(train_data)
        init_sim_time = perf_counter() - tic
        print(f"Initial training data collected in {init_sim_time:.2f} sec\n", flush=True)
        
        # ~~~ Active Learning Loop
        # Run training, inference, and simulation in a loop continuously until we've simulated enough molecules
        # Each successive batch of simulations should predict higher ionization energies
        print("Starting active learning loop\n", flush=True)
        batch = 1
        best_molecules = []
        model_accuracy = []
        while len(train_data) <= max_training_count:
            start_loop_time = perf_counter()
            print(f"Iteration {batch}:")
            
            # Train on subset of molecules
            weights_path = str(run_dir / f"MoLFormer_weights_iter{batch}.pt")
            tic = perf_counter()
            model_fit_time = train_model_app(train_data, weights_path).result()
            t_train = perf_counter() - tic
            print(
                f"\tTrained on {len(train_data)} molecules:\n"
                f"\t\ttotal time: {t_train:.2f} sec\n",
                f"\t\tfit_model time: {model_fit_time:.2f} sec", 
                f"\t\tworkflow overhead: {t_train - model_fit_time:.2f} sec", 
                flush=True
            )

            # Inference on all molecules (divided into chunks)
            tic = perf_counter()
            inference_futures = [inference_app(weights_path, cp) for cp in chunk_paths]
            inference_results = [f.result() for f in inference_futures]
            t_inf = perf_counter() - tic
            model_pred_time = sum(r["time"] for r in inference_results) / len(inference_results)
            print(
                f"\tPredicted {len(inference_results)} molecules:\n",
                f"\t\ttotal time: {t_inf:.2f} sec\n",
                f"\t\tpredict_model time: {model_pred_time:.2f} sec", 
                f"\t\tworkflow overhead: {t_inf - model_pred_time:.2f} sec",
                flush=True
            )

            # Sort inference predictions and store best molecules
            predictions = pd.concat([r["predictions"] for r in inference_results], ignore_index=True)
            predictions.sort_values('ie', ascending=False, inplace=True)
            for i in range(5):
                best_molecules.append({
                        'smiles': predictions['smiles'].iloc[i],
                        'ie': predictions['ie'].iloc[i],
                        'batch': batch,
                        'time': perf_counter() - start_time
                })

            # Submit new simulations for the top predictions
            sim_futures = []
            tic = perf_counter()
            for smiles in predictions['smiles']:
                if smiles not in already_ran:
                    sim_futures.append(compute_vertical_app(smiles))
                    already_ran.add(smiles)
                    if len(sim_futures) >= batch_size:
                        break

            # Wait for every simulation in the current batch to complete, and store successful results
            new_results = []
            for future in as_completed(sim_futures):
                if future.exception() is None:
                    new_results.append({
                        'smiles': future.task_record['args'][0],
                        'ie': future.result(),
                        'batch': batch, 
                        'time': perf_counter() - start_time
                    })
            t_sim = perf_counter() - tic
            new_results = pd.DataFrame(new_results)
            print(f"\tSimulated {len(sim_futures)} new molecules in {t_sim:.2f} sec", flush=True)

            # Compute model error estimate
            error = 0.
            for smiles in new_results['smiles']:
                true_ie = new_results[new_results['smiles'] == smiles]['ie'].iloc[0]
                predicted_ie = predictions[predictions['smiles'] == smiles]['ie'].iloc[0]
                error += abs(true_ie - predicted_ie) / abs(true_ie)
            error /= len(new_results)
            model_accuracy.append({
                'batch': batch,
                'error': error,
            })
            print(f"\tEstimate of MoLFormer Model Mean Relative Error (MRE): {100 * error:.2f} %", flush=True)
            best_smiles = predictions['smiles'].iloc[0]
            best_pred = predictions['ie'].iloc[0]
            best_match = new_results[new_results['smiles'] == best_smiles]
            if len(best_match) > 0:
                best_true = best_match['ie'].iloc[0]
                best_err = abs(best_true - best_pred) / abs(best_true)
                print(f"\tBest predicted molecule: {best_smiles} with ionization energy {best_pred:.2f} Ha (relative error: {100 * best_err:.2f} %)", flush=True)
            else:
                print(f"\tBest predicted molecule: {best_smiles} with ionization energy {best_pred:.2f} Ha", flush=True)

            # Update the training data
            train_data = pd.concat((train_data, new_results), ignore_index=True)
   
            # Repeat
            batch += 1
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
