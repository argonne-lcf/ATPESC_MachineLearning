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

- **[2_parsl_futures.py](./2_parsl_futures.py)** -- processes are luanched with Parsl's `HighThroughputExecutor` while data flows entirely through the `AppFuture` objects. The trained model weights (~200 MB) are serialized and transferred from the training worker back to the driver, then back to every inference worker along with the chunked SMILES on each iteration of the loop.
- **[3_parsl_io.py](./3_parsl_io.py)** -- processes are luanched with Parsl's `HighThroughputExecutor` while model weights and chunked SMILES are read/written to Lustre. Training and inference workers only pass light-weight metedata across the futures. 
- **[4_dragon.py](./4_dragon.py)** -- processes are launched with Dragon's native Pool and data is staged in a distributed in-memory dictionary provided by Dragon caled the DDict. Dragon supports RDMA-based transfers across nodes, meaning that worker either read/write to their local RAM or have fast access to other node's RAM instead of hitting the filesystem.

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

3. Simulate a large number of molecues with Parsl and estimate how long a brute-force screen would take with `python-xtb`:

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

The current implementation of the ative learning loop uses a simple strategy for picking which molecules to simulate next, also known as the data acquisition step. Specifically, at each iteration, the workflow predicts the IE for the full search space using the ML surrogate, sorts the predictions, and finally picks the K molecules with the highest predicted IE to simulate in order to augment the training set. This approach can be called greedy top-K and is one example of an *acquisition function* that AL workflows adopt to determine which new samples are worth "acquiring" for training.

A simple greedy top-K approach is often not the most effective because the model's top-K predictions tend to cluster ...

The problem with pure greedy top-K is that the model's top-K predictions tend to cluster: molecules that look similar to each other, from a region of chemical space the model already thinks it understands. That means simulations get spent confirming what the model already knows instead of teaching it something new. A better acquisition function typically balances **exploitation** (pick molecules the model predicts are best) against **exploration** (pick molecules the model is uncertain about, or that are structurally different from what it has already seen). Some ideas to try, roughly in order of implementation effort:

- **&epsilon;-greedy.** Pick `(1-&epsilon;)*batch_size` molecules by top-K as before, and `&epsilon;*batch_size` by uniform random sampling from the search space. Trivial to implement (a few lines around the "submit new simulations" block) and often meaningfully better than pure greedy at avoiding local optima. Try &epsilon; in the 0.1--0.3 range.

- **Diversity-aware batch selection.** Instead of picking the top-K by predicted IE, pick the top-1 and then iteratively add molecules that are both high-predicted-IE *and* dissimilar from the ones already picked in this batch. Similarity can be measured by SMILES/Morgan-fingerprint Tanimoto distance (RDKit has `DataStructs.TanimotoSimilarity`). Prevents the batch from being 64 copies of near-identical molecules.

- **Uncertainty via a small ensemble.** Train N (say 3--5) linear heads with different random seeds on top of the same frozen MoLFormer encoder. At inference time, run all N heads and take the mean prediction plus the standard deviation across the heads. The **standard deviation is a rough uncertainty estimate**. Pick molecules that maximize `mean + &lambda;*std` (Upper Confidence Bound) or that maximize `std` alone (pure exploration). The MoLFormer forward pass dominates cost, so N heads share that pass -- adding heads is cheap.

- **Expected Improvement (EI).** Compute the improvement each candidate would give over the best-simulated-so-far IE, weighted by the model's uncertainty. Classic Bayesian-optimization acquisition function; naturally trades off exploration and exploitation without a manual &epsilon; or &lambda;. Requires an uncertainty estimate (see ensemble above).

- **Query by committee.** Similar to the ensemble idea but the *disagreement* between models -- not the standard deviation -- is what drives selection. Molecules where the committee disagrees most are the most informative to simulate. Often equivalent to UCB in practice.

For any of these, keep everything else in the loop identical (same model, same simulation, same seeds) so the comparison is fair. Then look at:

- **Best IE discovered by iteration N** across acquisition functions. A better acquisition function should reach higher-IE molecules with fewer simulations.
- **MRE on the held-out (newly simulated) molecules** each iteration. If MRE stays high, the loop is exploring; if it drops, the loop is settling into a region it understands. Neither is inherently better -- what matters is which one finds better molecules faster.
- **Diversity of the top-K picks each iteration** (e.g., mean pairwise Tanimoto distance). Greedy top-K tends to collapse this over iterations; a good acquisition function shouldn't.

If you have time, also try varying `initial_training_count`, `max_training_count`, and `batch_size` and observe how the acquisition function's advantage changes. A cleverer acquisition function typically matters more when the simulation budget is small relative to the search space.
