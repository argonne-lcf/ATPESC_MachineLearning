from parsl_config import aurora_config
from chemfunctions import compute_vertical
import parsl
from parsl.app.app import python_app
from time import monotonic
from random import sample
import pandas as pd
import numpy as np
from concurrent.futures import as_completed

# This example will
# 1. Collect training data by running several simulations
# 2. Train a model using the training data
# 3. Run the model on a large search space of molecules to predict their properties

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
initial_count: int = 16  # Number of calculations to run at first

if __name__ == "__main__":

    # Load the Parsl configuration
    with parsl.load(aurora_config):

        start_time = monotonic()  # Start a timer to measure how long the simulations take

        # Create training data by running several simulations
        # randomly sample molecules from the search space to simulate
        smiles = search_space.sample(initial_count)['smiles']
        futures = [compute_vertical_app(s) for s in smiles]
        print(f'Submitted {len(futures)} simulations to start with')

        # Now we wait for the calculations to complete to populate training data
        train_data = []
        while len(futures) > 0:
            # First, get the next completed computation from the list
            future = next(as_completed(futures))
            
            # Remove it from the list of still-running tasks
            futures.remove(future)
            
            # Get the input 
            smiles = future.task_record['args'][0]
            
            # Check if the run completed successfully
            if future.exception() is not None:
                # If it failed, pick a new SMILES string at random and submit it    
                print(f'Computation for {smiles} failed, submitting a replacement computation')
                smiles = search_space.sample(1).iloc[0]['smiles'] # pick one molecule
                new_future = compute_vertical_app(smiles) # launch a simulation in Parsl
                futures.append(new_future) # store the Future so we can keep track of it
            else:
                # If it succeeded, store the result
                print(f'Computation for {smiles} succeeded')
                train_data.append({
                    'smiles': smiles,
                    'ie': future.result(),
                    'batch': 0,
                    'time': monotonic() - start_time
                })
        print("Training data collected.")
        train_data = pd.DataFrame(train_data)
        print(train_data)
        print("Starting training and inference.")
        
        # Train model
        train_future = train_model(train_data)

        # Chunk the search space into smaller pieces, so that each inference task can run in parallel
        chunks = np.array_split(np.array(search_space['smiles']), 102)
        # Create inference tasks, we can pass the train_future to the funtion
        inference_futures = [run_model(train_future, chunk) for chunk in chunks]

        # We pass the inputs explicitly as a named argument "inputs" for Parsl to recognize this as a "reduce" step
        #  See: https://parsl.readthedocs.io/en/stable/userguide/workflow.html#mapreduce
        predictions = combine_inferences(inputs=inference_futures).result()
        print("Training and inference completed.")
        print("Inference predictions:")
        print(predictions)
