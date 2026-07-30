"""Use Parsl to simulate a specified number of molecules from the QM9 search space.
"""

import argparse
import parsl
from parsl.app.app import python_app
from time import perf_counter
import pandas as pd
from concurrent.futures import as_completed

from utils.parsl_config import aurora_cpu_config
from chemfunctions import compute_vertical


if __name__ == "__main__":

    # ~~~ Read the arguments (to get num_molecules to simulate)
    parser = argparse.ArgumentParser(
        description="Simulate a random subset of molecules from the QM9 search space with xTB.",
    )
    parser.add_argument(
        "--num_molecules", type=int, default=1020,
        help="Number of molecules to sample from the search space and simulate (default: 128).",
    )
    args = parser.parse_args()

    # ~~~ Load space of molecules
    search_space = pd.read_csv('./data/QM9-search.tsv', sep=r'\s+')
    search_space_size = len(search_space)

    # ~~~ Define Parsl simulation app to compute the ionization energy of a molecule
    compute_vertical_app = python_app(compute_vertical)

    # ~~~ Load the Parsl CPU configuration (compute_vertical runs on the CPU)
    with parsl.load(aurora_cpu_config):

        # Mark when we started
        start_time = perf_counter()

        # ~~~ Sample num_molecules from the search space
        print(f"Sampled {args.num_molecules}/{search_space_size} random molecules")
        mols = search_space.sample(args.num_molecules)['smiles']

        # ~~~ Launch the simulations with Parsl
        tic = perf_counter()
        sim_futures = [compute_vertical_app(mol) for mol in mols]
        print(f'Submitted {len(sim_futures)} simulations ...', flush=True)

        # Collect the simulation data from the futures
        sim_data = []
        while len(sim_futures) > 0: 
            # First, get the next completed computation from the list
            future = next(as_completed(sim_futures))

            # Remove it from the list of still-running tasks
            sim_futures.remove(future)

            # Get the input 
            smiles = future.task_record['args'][0]

            # Check if the run completed successfully
            if future.exception() is not None:
                # If it failed, pick a new SMILES string at random and submit it    
                smiles = search_space.sample(1).iloc[0]['smiles']
                new_future = compute_vertical_app(smiles)
                sim_futures.append(new_future)
            else:
                # If it succeeded, store the result
                sim_data.append({
                    'smiles': smiles,
                    'ie': future.result(),
                    'time': perf_counter() - start_time
                })
        sim_data = pd.DataFrame(sim_data)
        sim_time = perf_counter() - tic
        print(f"Simulated {args.num_molecules} molecules in {sim_time:.2f} sec\n", flush=True)
        print(sim_data, flush=True)