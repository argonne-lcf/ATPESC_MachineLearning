# Introduction to Large Language Models — hands-on micro-lab

A short (~6–8 minute), **deterministic, CPU-only** notebook that walks through the
core mechanics of a language model end to end:

```
text → tokens → IDs → shifted targets → next-token loss → updated probabilities → sampled text
```

You will train a tiny (10,688-parameter) one-block decoder Transformer on a small
local corpus. It is **not** an LLM — it has a character-level vocabulary and a tiny
repeated corpus — but it uses the *same* next-token training objective as a real
decoder-only model.

## What you'll do

- **Part A — Tokenization:** split text into tokens and IDs; see how boundaries and
  Unicode normalization (NFC) change the tokens; compare tokenizers.
- **Part B — Training:** build the shifted `inputs`/`targets`, train with next-token
  cross-entropy, watch the loss drop, then generate a sample.
- **Visualizations:** character frequencies, the training-loss curve, and the model's
  next-token probability distribution.

## Files

| File | Purpose |
|---|---|
| `atpesc_llm_micro_lab.ipynb` | The lab notebook — run this |
| `lab_core.py` | Helper code (tokenizers, model, training) — imported by the notebook |
| `data/tiny_corpus.txt` | The local training corpus |
| `requirements.txt` | Python dependencies |

The lab computation runs locally on a CPU; the only network step is a one-time
fetch of the helper files (or installing dependencies).

## Setup

### Option A — Google Colab (recommended)

No local install: Colab already includes PyTorch and Matplotlib, and a free
**CPU** runtime is more than enough (no GPU needed).

1. Open [Google Colab](https://colab.research.google.com/) and sign in.
2. **File → Open notebook → GitHub**, search `jingyanjiang/ATPESC_MachineLearning`,
   and open `04_intro_to_LLMs/atpesc_llm_micro_lab.ipynb`.
3. The notebook needs its helper file and corpus, so add a **new first cell**,
   paste this, and run it once:
   ```python
   !wget -q https://raw.githubusercontent.com/jingyanjiang/ATPESC_MachineLearning/master/04_intro_to_LLMs/lab_core.py
   !mkdir -p data
   !wget -q https://raw.githubusercontent.com/jingyanjiang/ATPESC_MachineLearning/master/04_intro_to_LLMs/data/tiny_corpus.txt -O data/tiny_corpus.txt
   ```
4. Run the **Setup** cell and continue top to bottom.

### Option B — Your laptop (local)

```bash
# from this folder
python3 -m venv .venv
source .venv/bin/activate          # Windows: .venv\Scripts\activate
pip install -r requirements.txt
python -m ipykernel install --user --name atpesc-llm-lab --display-name "ATPESC LLM lab"
jupyter lab                         # opens your browser
```
Then open `atpesc_llm_micro_lab.ipynb` and pick the **ATPESC LLM lab** kernel.

## Run it

1. Run the **Setup** cell first (it prints your Python/PyTorch versions and fixes the
   random seed to 2026).
2. Work top to bottom. Wherever you see a **Try first** note, predict the answer
   before running the cell.
3. Use *Run → Run All Cells* to run everything at once.

The whole notebook takes only a few seconds of compute on a laptop CPU.

## What to expect

With seed `2026`, training reduces the fixed-batch next-token loss from about
**3.51 to 0.35** over 300 steps, and the seeded sample for the prompt `"aurora "`
begins:

```text
aurora trains models.
aurora trains weighs context.
exp
```

The continuation is imperfect on purpose: this toy model has learned local character
patterns, not general language ability. That contrast is the point of the lab.

## Tips

- Prompts must use lowercase letters, spaces, and periods (the toy vocabulary). Other
  characters map to an `<UNK>` token and produce garbled output.
- Results are deterministic: the same seed and prompt always give the same output.
