# Active Learning Workflow for Molecular Design 

This example demonstrates a simple molecular design application combining simulations with machine learning (ML) training and inference. The objective is to efficiently identify molecules with the largest ionization energies from a large dataset of potential candidates. 

The example was adapted from an [ExaWorks demo](https://github.com/ExaWorks/molecular-design-parsl-demo/tree/main) developed by Logan Ward, ANL, and later modified by Christine Simpson, ANL and Riccardo Balin, ANL. 

The ionization energy (IE) of a molecule is the amount of energy required to remove one electron from the molecule in its ground state to produce a positively charged ion.
IE can be computed with quantum-chemistry packages. Here we use [xTB](https://xtb-python.readthedocs.io/en/latest/), but other libraries can be used. Even for this example, each simulation is relatively expensive, so screening a large candidate library can be very expensive.
To make the search tractable we couple simulation with a surrogate machine-learning model that predicts IE directly from a molecule's SMILES string, and use it to decide which candidates are worth simulating next.
For this example, the [QM9 dataset](https://graphgt.github.io/molecule.html) with approximately 130,000 organic molecules is used as the search space.

The surrogate is a fine-tuned [MoLFormer-XL](https://huggingface.co/ibm/MoLFormer-XL-both-10pct) model (~50M params pretrained on ~1.1B molecules from ZINC and PubChem).
Since the MoLFormer's embeddings are already meaningful for the QM9 search space, the encoder (or backbone) is frozen and a single linear layer is trained on top of its pooled embeddings (see `MoLFormerRegressor` in [utils/molformer.py](./models/molformer.py)). This lightweight linear regression head is cheap to fine-tune even on a single GPU and adapts the pre-trained MoLFormer model to predict the IE scalar values. 

The simulation and surrogate model are applied sequentially in an iterative loop alternating between training, inference and data generation/acquisition. This approach is often called active learning (AL) and can be useful across many domains:

1. Simulate an initial batch of randomly chosen molecules to seed training data.
2. Fine-tune the linear head on the accumulated (SMILES, IE) pairs.
3. Predict IE for every molecule in the search space (~130k SMILES from QM9).
4. Simulate the top-K predicted molecules to obtain their true IE.
5. Fold those new (SMILES, IE) pairs into the training set and go back to step 2.

A schematic of the loop is shown below.

![workflow](../figures/workflow.svg)

This example walks through three implementations of the same AL loop; two of the implementations use [Parsl](https://github.com/Parsl/parsl) and one uses [Dragon](https://dragonhpc.org/). Parsl builds upon Python's [`concurrent.futures`](https://docs.python.org/3/library/concurrent.futures.html#module-concurrent.futures), so downstream tasks that consume upstream futures form an implicit dependency graph. Data dependencies between tasks can be shared through Parsl's `AppFuture` objects directly. 
Dragon extends Python `multiprocessing.Pool` to enable multi-node process launching and provides a distributed dictionary (DDict) for shared in-memory data staging. 
On Aurora both implementations route xTB simulations to CPU cores and MoLFormer training and inference to the PVC GPU tiles.

The three implementations showcase different ways of moving data (model state and search-space chunks) between tasks and launching processes across nodes:

- **[2_parsl_futures.py](./2_parsl_futures.py)** -- processes are launched with Parsl's `HighThroughputExecutor` while data flows entirely through the `AppFuture` objects. The trained model weights (~200 MB) are serialized and transferred from the training worker back to the driver, then back to every inference worker along with the chunked SMILES on each iteration of the loop.
- **[3_parsl_io.py](./3_parsl_io.py)** -- processes are launched with Parsl's `HighThroughputExecutor` while model weights and chunked SMILES are read/written to Lustre. Training and inference workers only pass light-weight metadata across the futures. 
- **[4_dragon.py](./4_dragon.py)** -- processes are launched with Dragon's native Pool and data is staged in a distributed in-memory dictionary provided by Dragon called the DDict. Dragon supports RDMA-based transfers across nodes, meaning that workers either read/write to their local RAM or have fast access to other nodes' RAM instead of hitting the filesystem.

All three workflow driver scripts use the same simulation primitive (`chemfunctions.compute_vertical`) and the same model primitives (`models.molformer.fit_model` and `models.molformer.predict_model`), so per-iteration training and inference *compute* times should be nearly identical across the three variants. What changes is what happens *around* those calls, specifically related to process launching and data movement, which is the focus of this lesson.

The drivers expose the same three parameters of the active learning loop:

```python
# Define parameters for the workflow
initial_training_count = 256  # Number of simulations for the first model training
max_training_count = 512      # Maximum training-set size (also the total simulation budget)
batch_size = 64               # New simulations per AL iteration
```

`initial_training_count` seeds the very first training pass; the loop then adds `batch_size` new simulations per iteration until `max_training_count` is reached. Balancing these values trades exploration (bigger initial batch → less biased first model) against exploitation (bigger per-iteration batch → faster convergence to the tail of the IE distribution). These parameters are some of the main knobs for optimizing the AL workflow.

To make comparisons of the workflow's computational performance and ability to fine-tune the model, the driver scripts output verbose information. This includes timings of the training, inference, and simulation components, the mean relative error of the model's predictions on the *newly simulated* molecules (a held-out set), and the best predicted molecule with its actual error. At the end of the run, a plot of the best identified molecules across iterations is generated and the full training history is saved to CSV. 

## Run Instructions

1. Submit an interactive job requesting 2 nodes (1 node is also okay):

    ```bash
    qsub -I -A ATPESC2026 -q ATPESC -l select=2 -l walltime=01:00:00 -l filesystems=home:flare
    ```

2. Source the environment provided and check imports:

    ```bash
    source 0_activate_env.sh
    python utils/test_imports.py
    ```

3. Simulate a large number of molecules with Parsl and estimate how long a brute-force screen would take with `python-xtb`:

    ```bash
    python 1_simulate_molecules.py
    ```

4. Run the Parsl workflow script moving data through futures:

    ```bash
    python 2_parsl_futures.py
    ```

5. Run the Parsl workflow script moving data through disk:

    ```bash
    python 3_parsl_io.py
    ```

6. Run the Dragon workflow script moving data through the DDict:

    ```bash
    dragon 4_dragon.py
    ```


## Improving the Active Learning Loop (Optional Homework)

The current implementation of the active learning loop uses a simple strategy for picking which molecules to simulate next, also known as the data acquisition step. At each iteration, the workflow predicts the ionization energy (IE) for the full search space using the ML surrogate, sorts the predictions, and finally picks the K molecules with the highest predicted IE to simulate in order to augment the training set. This top-K candidate selection is one example of an *acquisition function* that AL workflows adopt to determine which new samples are worth "acquiring" for training.

A simple top-K acquisition function is often not the most effective because it does not take into account the uncertainty/error of the predictions and can cluster the newly selected samples in a region of the search space where it is more confident and ignore other promising areas. 
We see the outcomes of these limitations in this example; the model identifies molecules with larger predicted IE as the loop iterations progress, however the error of those predictions also grows meaning that the model does not get better at identifying top candidates.

A better acquisition function typically balances *exploitation* against *exploration*. 
Exploitation involves choosing candidates in a part of the search space which the model predicts will maximize the objective. This can give immediate payoff by moving quickly towards the objective, but depends on whether the model is accurate. The top-K approach is completely biased towards exploitation.
Exploration involves choosing candidates which will expand the search over more areas of the search space and make the model more generalizable by looking at diverse candidates. This can delay the payoff but potentially improve the result by developing a better model and exploring more of the search space. 

Below are some ideas to try, roughly in order of implementation effort:

- **&epsilon;-greedy.** Pick `(1-&epsilon;)*batch_size` molecules by top-K sorting, and `&epsilon;*batch_size` by uniform random sampling from the entire search space. This approach directly balances exploitation (`&epsilon;=0`) and exploration (`&epsilon;=1`) and while simple it can often provide a significant improvement over top-K. Try &epsilon; in the range 0.1--0.5.

- **Diversity-aware batch selection.** Instead of picking the top-K by predicted IE, pick the top 1 and then iteratively add molecules that are both high-predicted-IE *and* dissimilar from the ones already picked in this batch. Which measure of similarity to choose is often problem dependent, but here we can use the Tanimoto similarity (see code snippet below). This approach ensures the newly acquired training samples are diverse and the model does not bias towards a specific area of the search space.

```python
from rdkit import Chem, DataStructs
from rdkit.Chem import rdFingerprintGenerator

smiles = {"methanol": "CO", "ethanol": "CCO"}

# Build Morgan fingerprints (ECFP4-like: radius=2, 2048 bits)
mfpgen = rdFingerprintGenerator.GetMorganGenerator(radius=2, fpSize=2048)
fps = {name: mfpgen.GetFingerprint(Chem.MolFromSmiles(s))
       for name, s in smiles.items()}

# Tanimoto distance (larger values mean less similar)
dist = 1.0 - DataStructs.TanimotoSimilarity(fps["methanol"], fps["ethanol"])
print(f"Tanimoto distance (methanol vs ethanol): {dist:.2f}")
```

- **Uncertainty via a small ensemble.** Train N (say 3--5) linear heads with different random seeds on top of the same frozen MoLFormer encoder. At inference time, run all N heads and use the mean as the predicted IE and the standard deviation as a *rough uncertainty estimate*. Sort and pick molecules according to the largest upper confidence bound (UCB) `mean + &lambda;*std` (1 is a good starting value for &lambda;, providing a balance of exploitation and exploration). Note that the MoLFormer forward pass dominates cost during inference, so it is cheaper to evaluate the encoder once and then the N heads. 

- **Query by committee.** Similar to the ensemble idea but the *disagreement* between models is what drives selection, thus prioritizing exploration. Molecules where the committee disagrees most (e.g., the largest variance) are the most informative to simulate.

For any of these acquisition functions, keep everything else in the loop identical (same model, same simulation, same seeds) so the comparison is fair. Also, make sure to modify the `initial_training_count`, `batch_size`, and `max_training_count` parameters of the workflow to find the right balance between initial exploration and loop acquisition. 
Then look at the best identified molecule along with its IE, the MRE for each loop iteration, and the total run time to evaluate how the loop is performing and how quickly it converges.

