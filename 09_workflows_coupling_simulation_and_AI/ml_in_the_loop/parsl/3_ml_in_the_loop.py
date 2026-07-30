from parsl_config import aurora_config
from chemfunctions import compute_vertical, train_model, run_model
from matplotlib import pyplot as plt
import parsl
from parsl.app.app import python_app
from time import monotonic
from random import sample
import pandas as pd
import numpy as np
from concurrent.futures import as_completed
from pathlib import Path

# This example will loop through the following steps:
# 1. Collect training data by running several simulations
# 2. Train a model using the training data
# 3. Run the model on a large search space of molecules to predict their properties
# 4. Loop back to step 1 with the new model to collect more training data
# 5. Repeat until enough molecules have been simulated

# Define parameters for the workflow
initial_count: int = 8  # Number of simulations to run for first model training
search_count: int = 32  # Number of molecules to simulate in total
batch_size: int = 4  # Number of molecules to simulate in each batch of simulations

# Define Parsl apps for each step in the workflow
# Simulation app to compute the ionization energy of a molecule
compute_vertical_app = python_app(compute_vertical)
# Model training app
train_model_app = python_app(train_model)
# Inference app to run the model on a list of SMILES strings
inference_app = python_app(run_model)
# Convenience app to combine multiple inferences into a single DataFrame
@python_app
def combine_inferences(inputs=[]):
    """Concatenate a series of inferences into a single DataFrame
    Args:
        inputs: a list of the component DataFrames
    Returns:
        A single DataFrame containing the same inferences
    """
    import pandas as pd
    return pd.concat(inputs, ignore_index=True)

# Search space of molecules to sample from
search_space = pd.read_csv('./data/QM9-search.tsv', sep='\s+')  # Our search space of molecules

if __name__ == "__main__":

    train_data = []

    # Load the Parsl configuration
    with parsl.load(aurora_config):

        # Mark when we started
        start_time = monotonic()

        print("Create initial training data")
        print(f"Starting with {initial_count} random molecules")
        print(f"Will run {search_count} simulations in total")
        print(f"Will run {batch_size} simulations in each loop iteration")

        # Start with some random guesses for simulations to create initial training data
        train_data = []
        init_mols = search_space.sample(initial_count)['smiles']
        sim_futures = [compute_vertical_app(mol) for mol in init_mols]
        already_ran = set()

        # Loop until you finish populating the initial training set of simulation results
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
                    'time': monotonic() - start_time
                })

        # Create the initial training set
        train_data = pd.DataFrame(train_data)
        # Chunk the search space into smaller pieces, so that each inference task can run in parallel
        # Use the number of nodes and workers per node to determine how many chunks to create
        num_nodes = aurora_config.executors[0].provider.nodes_per_block  # Get the number of nodes from the config
        num_workers_pn = aurora_config.executors[0].workers_per_node  # Get the number of workers per node from the config
        num_chunks = min(num_nodes * num_workers_pn * 2, len(search_space['smiles']))  # Limit the number of chunks by the number of workers
        chunks = np.array_split(np.array(search_space['smiles']), num_chunks)
        
        # ML-in-the-loop
        # Run training, inference, and simulation in a loop continuously until we've simulated enough molecules
        # Each successive batch of simulations should predict higher ionization energies
        batch = 1
        while len(train_data) < search_count:
            start_loop_time = monotonic()
            print(f"Batch {batch} training on {len(train_data)} simulation results")
            
            # Train and predict as shown in the previous example.
            train_future = train_model_app(train_data)
            
            inference_futures = [inference_app(train_future, chunk) for chunk in chunks]
            predictions = combine_inferences(inputs=inference_futures).result()

            # Sort inference predictions in descending order, and simulate the top ones
            predictions.sort_values('ie', ascending=False, inplace=True)
            sim_futures = []
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
                        'time': monotonic() - start_time
                    })
   
            # Update the training data and repeat
            batch += 1
            train_data = pd.concat((train_data, pd.DataFrame(new_results)), ignore_index=True)
            print(f"...finished loop iter in {monotonic() - start_loop_time}s")
    
    print("Simulations complete, plotting results...")
    fig, ax = plt.subplots(figsize=(4.5, 3.))
    ax.scatter(train_data['time'], train_data['ie'])
    ax.step(np.array(train_data['time']), np.array(train_data['ie'].cummax()), 'k--')
    ax.set_xlabel('Walltime (s)')
    ax.set_ylabel('Ion. Energy (Ha)')
    fig.tight_layout()
    fig.savefig('ml_in_the_loop.png', dpi=300)

    # Saving results
    Path('run-data').mkdir(exist_ok=True)
    train_data.to_csv('run-data/parsl-results.csv', index=False)
