"""Simulation functions for the chemistry active-learning workflow.

Contains the quantum-chemistry primitives (SMILES -> XYZ, xtb vertical
ionization energy). ML models live in ./models/.
"""
import os
from concurrent.futures import ProcessPoolExecutor
from functools import partial, update_wrapper
from io import StringIO

import numpy as np
from ase.io import read
from ase.optimize import LBFGSLineSearch
from rdkit import Chem
from rdkit.Chem import AllChem
from xtb.ase.calculator import XTB


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


if __name__ == "__main__":
    energy = compute_vertical('OC')
    print(energy)
