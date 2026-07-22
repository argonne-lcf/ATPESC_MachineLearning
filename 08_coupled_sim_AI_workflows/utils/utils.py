# Utilities for the active learning examples

from matplotlib import pyplot as plt
import numpy as np
import pandas as pd

def plot_best_molecules(best_molecules: pd.DataFrame, batch: int) -> None:
    """Plot the ionization energy of the best molecules for each iteration
    of the active learning loop.
    """
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(8, 3.))
    ax1.scatter(best_molecules['batch'], best_molecules['ie'])
    ax1.step(np.array(best_molecules['batch']), np.array(best_molecules['ie'].cummax()), 'k--')
    ax1.set_xticks(range(1,batch))
    ax1.set_xlabel('Loop Iteration')
    ax1.set_ylabel('Ion. Energy (Ha)')
    ax1.grid(True)
    ax1.set_title('Best Predicted Molecules over Loop Iterations')
    ax2.scatter(best_molecules['time'], best_molecules['ie'])
    ax2.step(np.array(best_molecules['time']), np.array(best_molecules['ie'].cummax()), 'k--')
    #ax2.set_xlim(0, end_time - start_time)
    ax2.set_xlabel('Time (s)')
    ax2.set_ylabel('Ion. Energy (Ha)')
    ax2.grid(True)
    ax2.set_title('Best Predicted Molecules over Time')
    fig.tight_layout()
    fig.savefig('active_learning_parsl.png', dpi=300)