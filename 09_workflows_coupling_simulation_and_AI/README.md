# Active Learning Workflow for Molecular Design 

This example demonstrates a simple molecular design application combining simulations with machine learning (ML) training and inference. The objective is to efficiently identify molecules with the largest ionization energies from a large dataset of potential candidates. 

The example was adapted from an [ExaWorks demo](https://github.com/ExaWorks/molecular-design-parsl-demo/tree/main) developed by Logan Ward, ANL, and later modified by Christine Simpson, ANL and Riccardo Balin, ANL. 

The ionization energy (IE) of a molecule is the amount of energy required to remove one electron from the molecule in its ground state to produce a positively charged ion.
IE can be computed with quantum-chemistry packages. Here we use [xTB](https://xtb-docs.readthedocs.io/en/latest/contents.html), but other libraries can be used. Even for this example, each simulation is relatively expensive, so screening a large candidate library exhaustively is out of reach on any realistic compute budget.
To make the search tractable we couple simulation with a surrogate machine-learning model that predicts IE directly from a molecule's SMILES string, and use it to decide which candidates are worth simulating next.

The surrogate is a fine-tuned [MoLFormer-XL](https://huggingface.co/ibm/MoLFormer-XL-both-10pct) model (IBM, ~50M params, pretrained on ~1.1B molecules from ZINC and PubChem).
The encoder (or backbone) is frozen and a single linear regression head is trained on top of its pooled embeddings. This lightweight "linear probe" is cheap to fine-tune even on a single GPU and adapts the pre-trained MoLFormer model to predict the IE scalar values. Since the MoLFormer's embeddings are already meaningful for the QM9 search space.

Simulation and surrogate are woven together in an iterative loop, an approach often called [active learning](https://pubs.acs.org/doi/abs/10.1021/acs.chemmater.0c00768) (AL):

1. Simulate an initial batch of randomly chosen molecules to seed training data.
2. Fine-tune the linear head on the accumulated (SMILES, IE) pairs.
3. Predict IE for every molecule in the search space (~130k SMILES from QM9).
4. Simulate the top-K predicted molecules to obtain their true IE.
5. Fold those new (SMILES, IE) pairs into the training set and go back to step 2.

A schematic of the loop is shown below.

![workflow](../figures/workflow.svg)

This example ships three implementations of the same AL loop, each demonstrating a different way of moving data (model state and search-space chunks) between tasks:

- **[2_parsl_futures.py](./2_parsl_futures.py)** -- data flows entirely through Parsl's `AppFuture` objects. The trained model's state_dict (~200 MB) is serialized and shipped from the training worker back to the driver, then re-shipped to every inference worker on the next iteration.
- **[3_parsl_io.py](./3_parsl_io.py)** -- the training worker writes the state_dict to Lustre and returns only a path. Inference workers read it back from disk. Futures now carry small strings; the model state moves through the filesystem.
- **[4_dragon.py](./4_dragon.py)** -- data lives in a distributed in-memory dictionary provided by [Dragon](https://dragonhpc.org/) (DDict), which supports RDMA-based transfers across nodes. The state_dict is stored under a key in the DDict once per iteration and workers read their local RAM instead of hitting the filesystem.

All three drivers use the same simulation primitive (`chemfunctions.compute_vertical`) and the same model primitives (`models.molformer.fit_model` and `models.molformer.predict_model`), so per-iteration training and inference *compute* times should be nearly identical across the three variants. What changes is what happens *around* those calls -- and that is exactly the story: at what scale does the data-movement strategy start dominating wall clock, and when is a purely futures-based approach no longer good enough?

Two of the drivers use [Parsl](https://github.com/Parsl/parsl) to submit and route tasks; one uses [Dragon](https://dragonhpc.org/). Parsl integrates cleanly with Python's [`concurrent.futures`](https://docs.python.org/3/library/concurrent.futures.html#module-concurrent.futures), so downstream tasks that consume upstream futures form an implicit dependency graph. Dragon offers a `multiprocessing.Pool`-style interface plus the DDict for shared in-memory state. On Aurora both stacks route xTB simulations to CPU cores and MoLFormer training and inference to the PVC GPU tiles.

To provide a baseline, [1_simulate_molecules.py](./1_simulate_molecules.py) simulates a user-specified number of random molecules with xTB (no ML in the loop). This gives students a feel for how long an exhaustive brute-force screen would take -- and therefore what the AL loop is buying you.

The three workflow drivers all expose the same three parameters:

```python
# Define parameters for the workflow
initial_training_count = 256  # Number of simulations for the first model training
max_training_count = 512      # Maximum training-set size (also the total simulation budget)
batch_size = 64               # New simulations per AL iteration
```

`initial_training_count` seeds the very first training pass; the loop then adds `batch_size` new simulations per iteration until `max_training_count` is reached. Balancing these values trades exploration (bigger initial batch → less biased first model) against exploitation (bigger per-iteration batch → faster convergence to the tail of the IE distribution). These parameters are the primary knobs you should experiment with.

Each iteration prints per-phase timings (training, inference, simulation), the mean relative error of the model's predictions on the *newly simulated* molecules (a held-out set), and the best predicted molecule with its actual error. At the end of the run, a plot of the best identified molecules across iterations is generated and the full training history is saved to CSV. Both are useful for the homework problem below.

## Run Instructions

1. Submit an interactive job requesting 2 nodes (1 node is also okay):

    ```bash
    qsub -I -A ATPESC2026 -q ATPESC -l select=2 -l walltime=01:00:00 -l filesystems=home:flare
    ```

2. Source the environment provided:

    ```bash
    source 0_activate_env.sh
    ```

3. Simulate a large number of molecues with Parsl:

    ```bash
    python 1_simulate_molecules.py
    ```

4. Run the Parsl workflow script moving data through futures

    ```bash
    python 2_parsl_futures.py
    ```

5. Run the Parsl workflow script moving data through disk

    ```bash
    python 3_parsl_io.py
    ```

6. Run the Dragon workflow script moving data through the DDict

    ```bash
    dragon 4_dragon.py
    ```


## Improving the Active Learning Loop (Homework)

The current loop uses the simplest possible strategy for picking which molecules to simulate next: **greedy top-K**. Each iteration, the model predicts IE for the full search space, sorts, and picks the K molecules with the highest predicted IE. This is one specific choice of *acquisition function* -- the function that scores each candidate for how much it's worth simulating -- and it is often not the best one.

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
