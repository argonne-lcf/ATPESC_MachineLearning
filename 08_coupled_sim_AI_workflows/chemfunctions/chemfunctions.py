"""Functions used to perform chemistry tasks in the Parsl workflow

While Parsl does offer the ability to run functions defined in a Jupyter notebook,
we define them here to keep the notebook cleaner   
"""
import os
from concurrent.futures import ProcessPoolExecutor
from functools import partial, update_wrapper
from typing import List
from io import StringIO

import numpy as np
import pandas as pd
import torch
import torch.nn as nn
from ase.io import read
from ase.optimize import LBFGSLineSearch
from rdkit import Chem, DataStructs
from rdkit.Chem import AllChem
from xtb.ase.calculator import XTB
from sklearn.base import TransformerMixin, BaseEstimator
from sklearn.neighbors import KNeighborsRegressor
from sklearn.pipeline import Pipeline
from rdkit.Chem import rdFingerprintGenerator
from transformers import AutoTokenizer, AutoModel, AutoConfig

# Make a global pool for this particular Python thread
#  Not a great practice, as it will not exit until Python does.
#  Useful on HPC as it limits the number of times we call `fork`
#   and we know the nodes where this run will get purged after tasks complete
n_workers = max(len(os.sched_getaffinity(0)) - 1, 1)  # Get as many threads as we are assigned to
_pool = ProcessPoolExecutor(max_workers=n_workers)

"""SIMULATION FUNCTIONS: Quantum chemistry parts of the workflow"""
def generate_initial_xyz(mol_string: str) -> str:
    """Generate the XYZ coordinates for a molecule.
    
    Args:
        mol_string: SMILES string

    Returns:
        - InChI string for the molecule
        - XYZ coordinates for the molecule
    """

    # Generate 3D coordinates for the molecule
    mol = Chem.MolFromSmiles(mol_string)
    if mol is None:
        raise ValueError(f'Parse failure for {mol_string}')
    mol = Chem.AddHs(mol)
    AllChem.EmbedMolecule(mol, randomSeed=1)
    AllChem.MMFFOptimizeMolecule(mol)

    # Save geometry as 3D coordinates
    xyz = f"{mol.GetNumAtoms()}\n"
    xyz += mol_string + "\n"
    conf = mol.GetConformer()
    for i, a in enumerate(mol.GetAtoms()):
        s = a.GetSymbol()
        c = conf.GetAtomPosition(i)
        xyz += f"{s} {c[0]} {c[1]} {c[2]}\n"

    return xyz


def _run_in_process(func, *args):
    """Hack to make each execution run in a separate process. XTB or geoMETRIC is bad with file handles

    Args:
        func: Function to evaluate
        args: Input arguments
    """

    with ProcessPoolExecutor(max_workers=1) as exe:
        print(args)
        fut = exe.submit(func, *args)
        return fut.result()


def _compute_vertical(smiles: str) -> float:
    """Run the ionization potential computation

    Args:
        smiles: SMILES string to evaluate
    Returns:
        Ionization energy in Ha
    """

    # Make the initial geometry
    xyz = generate_initial_xyz(smiles)
    
    # Make the XTB calculator
    calc = XTB(accuracy=0.05)
    
    # Parse the molecule
    atoms = read(StringIO(xyz), format='xyz')

    # Compute the neutral geometry
    #  Uses QCEngine (https://github.com/MolSSI/QCEngine) to handle interfaces to XTB
    atoms.calc = calc
    dyn = LBFGSLineSearch(atoms, logfile=None)
    dyn.run(fmax=0.02, steps=250)
    
    neutral_energy = atoms.get_potential_energy()

    # Compute the energy of the relaxed geometry in charged form
    charges = np.ones((len(atoms),)) * (1 / len(atoms))
    atoms.set_initial_charges(charges)
    charged_energy = atoms.get_potential_energy()
    
    return charged_energy - neutral_energy


# Make versions that execute in separate processes
compute_vertical = partial(_run_in_process, _compute_vertical)
compute_vertical = update_wrapper(compute_vertical, _compute_vertical)
compute_vertical.__name__ = 'compute_vertical'

"""MACHINE LEARNING FUNCTIONS: Predicting the output of quantum chemistry"""


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
    mfpgen = rdFingerprintGenerator.GetMorganGenerator(radius=fingerprint_radius,fpSize=fingerprint_length)
    #fingerprint = AllChem.GetMorganFingerprintAsBitVect(
    #    molecule, fingerprint_radius, fingerprint_length)
    fingerprint = mfpgen.GetFingerprint(molecule)
    arr = np.zeros((1,), dtype=bool)

    # ConvertToNumpyArray takes ~ 0.19 ms, while
    # np.asarray takes ~ 4.69 ms
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

def train_knn_model(train_data):
    """Train a machine learning model using Morgan Fingerprints.
    
    Args:
        train_data: Dataframe with a 'smiles' and 'ie' column
            that contains molecule structure and property, respectfully.
    Returns:
        A trained model
    """
    
    model = Pipeline([
        ('fingerprint', MorganFingerprintTransformer()),
        ('knn', KNeighborsRegressor(n_neighbors=4, weights='distance', metric='jaccard', n_jobs=-1))  # n_jobs = -1 lets the model run all available processors
    ])
    
    return model.fit(train_data['smiles'], train_data['ie'])


def run_knn_model(model, smiles):
    """Run a model on a list of smiles strings

    Args:
        model: Trained model that takes SMILES strings as inputs
        smiles: List of molecules to evaluate
    Returns:
        A dataframe with the molecules and their predicted outputs
    """
    pred_y = model.predict(smiles)
    return pd.DataFrame({'smiles': smiles, 'ie': pred_y})


"""MoLFormer-XL FINE-TUNING PATH: pre-trained SMILES encoder + linear regression head"""

_MODEL_DIR = os.environ.get("MOLFORMER_WEIGHTS_DIR")
_tokenizer = None
_base_encoder = None
_encoder_hidden = None


def _get_device():
    if hasattr(torch, "xpu") and torch.xpu.is_available():
        return torch.device("xpu")
    elif hasattr(torch, "cuda") and torch.cuda.is_available():
        return torch.device("cuda")
    return torch.device("cpu")


def _get_tokenizer_and_encoder():
    """Load the MoLFormer tokenizer + encoder once per worker process.

    Returns cached instances on subsequent calls so we pay the load cost once
    per worker for the whole run instead of once per Parsl app invocation.
    """
    global _tokenizer, _base_encoder, _encoder_hidden
    if _tokenizer is None:
        if not _MODEL_DIR:
            raise RuntimeError(
                "MOLFORMER_WEIGHTS_DIR is not set; point it at the local "
                "MoLFormer snapshot directory."
            )
        _tokenizer = AutoTokenizer.from_pretrained(
            _MODEL_DIR, trust_remote_code=True, local_files_only=True,
        )
        _base_encoder = AutoModel.from_pretrained(
            _MODEL_DIR, deterministic_eval=True,
            trust_remote_code=True, local_files_only=True,
        )
        _encoder_hidden = AutoConfig.from_pretrained(
            _MODEL_DIR, trust_remote_code=True, local_files_only=True,
        ).hidden_size
    return _tokenizer, _base_encoder, _encoder_hidden


class MoLFormerRegressor(nn.Module):
    """MoLFormer encoder + linear head for scalar regression of IE scalars."""

    def __init__(self, encoder, hidden):
        super().__init__()
        # MoLFormer encoder (backbone)
        self.encoder = encoder
        # Linear regression head
        self.head = nn.Linear(hidden, 1)

    def forward(self, input_ids, attention_mask):
        out = self.encoder(input_ids=input_ids, attention_mask=attention_mask)
        return self.head(out.pooler_output).squeeze(-1)


def train_molformer_model(train_data):
    """Fine-tune MoLFormer-XL on (SMILES, IE) pairs.

    Args:
        train_data: Dataframe with 'smiles' and 'ie' columns.
    Returns:
        Dict with CPU state_dict and target normalization stats.
    """
    tokenizer, base_encoder, hidden = _get_tokenizer_and_encoder()
    device = _get_device()

    model = MoLFormerRegressor(base_encoder, hidden).to(device)

    # Freeze the MoLFOrmer encoder since it already produces meaningful 
    # embeddings for this dataset. Only train the linear regression head.
    for p in model.encoder.parameters():
        p.requires_grad = False

    smiles = list(train_data['smiles'])
    y = torch.tensor(train_data['ie'].to_numpy(), dtype=torch.float32)
    y_mean = float(y.mean())
    y_std = float(y.std().clamp_min(1e-6))
    y_norm = ((y - y_mean) / y_std).to(device)

    enc = tokenizer(
        smiles, padding='longest', truncation=True, max_length=256,
        return_tensors='pt',
    )
    input_ids = enc['input_ids'].to(device)
    attention_mask = enc['attention_mask'].to(device)

    optim = torch.optim.AdamW(model.head.parameters(), lr=5e-5)
    loss_fn = nn.MSELoss()

    epochs = 10
    batch_size = 16
    n = len(smiles)

    model.train()
    for _ in range(epochs):
        perm = torch.randperm(n, device=device)
        for start in range(0, n, batch_size):
            idx = perm[start:start + batch_size]
            optim.zero_grad()
            pred = model(input_ids[idx], attention_mask[idx])
            loss = loss_fn(pred, y_norm[idx])
            loss.backward()
            optim.step()

    return {
        "state_dict": {k: v.detach().cpu() for k, v in model.state_dict().items()},
        "y_mean": y_mean,
        "y_std": y_std,
    }


def run_molformer_model(model_state, smiles):
    """Run a fine-tuned MoLFormer regressor over a list of SMILES.

    Args:
        model_state: Dict returned by train_model_molformer.
        smiles: List of SMILES strings.
    Returns:
        Dataframe with 'smiles' and 'ie' columns (same shape as run_model).
    """
    tokenizer, base_encoder, hidden = _get_tokenizer_and_encoder()
    device = _get_device()

    model = MoLFormerRegressor(base_encoder, hidden)
    model.load_state_dict(model_state["state_dict"])
    model.to(device).eval()

    smiles = list(smiles)
    batch_size = 64
    preds = []
    with torch.no_grad():
        for start in range(0, len(smiles), batch_size):
            batch = smiles[start:start + batch_size]
            enc = tokenizer(
                batch, padding='longest', truncation=True, max_length=256,
                return_tensors='pt',
            )
            out = model(
                enc['input_ids'].to(device),
                enc['attention_mask'].to(device),
            )
            preds.append(out.detach().cpu())
    pred_y = torch.cat(preds).numpy() * model_state["y_std"] + model_state["y_mean"]
    return pd.DataFrame({'smiles': smiles, 'ie': pred_y})


if __name__ == "__main__":
    energy = compute_vertical('OC')
    print(energy)
