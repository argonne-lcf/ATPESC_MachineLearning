from parsl_config import aurora_config
from chemfunctions import compute_vertical
from matplotlib import pyplot as plt
import parsl
from parsl.app.app import python_app
from time import monotonic
from random import sample
import pandas as pd
import numpy as np
from concurrent.futures import as_completed
from pathlib import Path


# Model training app
@python_app
def train_model(train_data):
    """Train a machine learning model using Morgan Fingerprints.
    
    Args:
        train_data: Dataframe with a 'smiles' and 'ie' column
            that contains molecule structure and property, respectfully.
    Returns:
        A trained model
    """
    # Imports for python functions run remotely must be defined inside the function
    from chemfunctions import MorganFingerprintTransformer
    from sklearn.neighbors import KNeighborsRegressor
    from sklearn.pipeline import Pipeline
    
    
    model = Pipeline([
        ('fingerprint', MorganFingerprintTransformer()),
        ('knn', KNeighborsRegressor(n_neighbors=4, weights='distance', metric='jaccard', n_jobs=-1))  # n_jobs = -1 lets the model run all available processors
    ])
    
    return model.fit(train_data['smiles'], train_data['ie'])

# Inference app to run the model on a list of SMILES strings
@python_app
def run_model(model, smiles):
    """Run a model on a list of smiles strings
    
    Args:
        model: Trained model that takes SMILES strings as inputs
        smiles: List of molecules to evaluate
    Returns:
        A dataframe with the molecules and their predicted outputs
    """
    import pandas as pd
    pred_y = model.predict(smiles)
    return pd.DataFrame({'smiles': smiles, 'ie': pred_y})

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

# Simulation app to compute the ionization energy of a molecule
compute_vertical_app = python_app(compute_vertical)

# Search space of molecules to sample from
search_space = pd.read_csv('./data/QM9-search.tsv', sep='\s+')  # Our search space of molecules
initial_count: int = 16  # Number of simulations to run for first model training
search_count: int = 64   # Number of molecules to simulate in total
batch_size: int = 8  # Number of molecules to simulate in each batch of simulations

if __name__ == "__main__":

    train_data = []

    # Load the Parsl configuration
    with parsl.load(aurora_config):

        # Mark when we started
        start_time = monotonic()

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

        # ML-in-the-loop
        # Run training, inference, and simulation in a loop continuously until we've simulated enough molecules
        # Each successive batch of simulations should predict higher ionization energies
        batch = 1
        while len(train_data) < search_count:
            start_loop_time = monotonic()
            print(f"Batch {batch} training on {len(train_data)} simulation results")
            
            # Train and predict as shown in the previous example.
            train_future = train_model(train_data)
            chunks = np.array_split(np.array(search_space['smiles']), 102)

            inference_futures = [run_model(train_future, chunk) for chunk in chunks]
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
