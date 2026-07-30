"""KNN + Morgan fingerprint baseline model.

Exposes pure fit_knn / predict_knn primitives; the driver script wraps
these into Parsl apps and decides how the model is passed between them.
"""
import os
from concurrent.futures import ProcessPoolExecutor
from functools import partial

import numpy as np
import pandas as pd
from rdkit import Chem, DataStructs
from rdkit.Chem import rdFingerprintGenerator
from sklearn.base import TransformerMixin, BaseEstimator
from sklearn.neighbors import KNeighborsRegressor
from sklearn.pipeline import Pipeline


# Make a global pool for this particular Python thread
#  Not a great practice, as it will not exit until Python does.
#  Useful on HPC as it limits the number of times we call `fork`
#   and we know the nodes where this run will get purged after tasks complete
n_workers = max(len(os.sched_getaffinity(0)) - 1, 1)
_pool = ProcessPoolExecutor(max_workers=n_workers)


def compute_morgan_fingerprints(smiles: str, fingerprint_length: int, fingerprint_radius: int):
    """Get Morgan Fingerprint of a specific SMILES string.
    Adapted from: <https://github.com/google-research/google-research/blob/
    dfac4178ccf521e8d6eae45f7b0a33a6a5b691ee/mol_dqn/chemgraph/dqn/deep_q_networks.py#L750>
    Args:
      graph (str): The molecule as a SMILES string
      fingerprint_length (int): Bit-length of fingerprint
      fingerprint_radius (int): Radius used to compute fingerprint
    Returns:
      np.array. shape = [hparams, fingerprint_length]. The Morgan fingerprint.
    """
    # Parse the molecule
    molecule = Chem.MolFromSmiles(smiles)

    # Compute the fingerprint
    mfpgen = rdFingerprintGenerator.GetMorganGenerator(radius=fingerprint_radius, fpSize=fingerprint_length)
    fingerprint = mfpgen.GetFingerprint(molecule)
    arr = np.zeros((1,), dtype=bool)

    # ConvertToNumpyArray takes ~ 0.19 ms, while np.asarray takes ~ 4.69 ms
    DataStructs.ConvertToNumpyArray(fingerprint, arr)
    return arr


class MorganFingerprintTransformer(BaseEstimator, TransformerMixin):
    """Class that converts SMILES strings to fingerprint vectors"""

    def __init__(self, length: int = 256, radius: int = 4):
        self.length = length
        self.radius = radius

    def fit(self, X, y=None):
        return self  # Do need to do anything

    def transform(self, X, y=None):
        """Compute the fingerprints

        Args:
            X: List of SMILES strings
        Returns:
            Array of fingerprints
        """

        my_func = partial(compute_morgan_fingerprints,
                          fingerprint_length=self.length,
                          fingerprint_radius=self.radius)
        fing = _pool.map(my_func, X, chunksize=2048)
        test_fing = []
        for f in fing:
            test_fing.append(f)
        return np.vstack(test_fing)


def fit_knn(train_data):
    """Train a KNN regressor over Morgan fingerprints.

    Args:
        train_data: Dataframe with 'smiles' and 'ie' columns.
    Returns:
        A fitted sklearn Pipeline.
    """
    model = Pipeline([
        ('fingerprint', MorganFingerprintTransformer()),
        ('knn', KNeighborsRegressor(n_neighbors=4, weights='distance', metric='jaccard', n_jobs=-1)),
    ])
    return model.fit(train_data['smiles'], train_data['ie'])


def predict_knn(model, smiles):
    """Predict IE for a list of SMILES using a fitted KNN pipeline.

    Args:
        model: Trained sklearn Pipeline returned by fit_knn.
        smiles: List of SMILES strings.
    Returns:
        Dataframe with 'smiles' and 'ie' columns.
    """
    pred_y = model.predict(smiles)
    return pd.DataFrame({'smiles': smiles, 'ie': pred_y})
