# Instructions for ATPESC Hands-On Tutorial

> [!NOTE]
> Slides are available at:  
> https://samf.sh/talks/2026/08/03

1. Submit an interactive job:

    ```bash
    # from Aurora login node
    qsub -A <proj> -q prod -l walltime=03:00:00,filesystems=flare:home -l select=2 -I
    ```

2. [From the compute node](https://docs.alcf.anl.gov/aurora/getting-started-on-aurora/#submitting-and-running-jobs):

    ```bash
    # from Aurora compute node (`x4...`)
    # proxy settings
    if [[ ! "${HOSTNAME}" =~ aurora-uan ]]; then
      export HTTP_PROXY="http://proxy.alcf.anl.gov:3128"
      export HTTPS_PROXY="http://proxy.alcf.anl.gov:3128"
      export http_proxy="http://proxy.alcf.anl.gov:3128"
      export https_proxy="http://proxy.alcf.anl.gov:3128"
      export ftp_proxy="http://proxy.alcf.anl.gov:3128"
      export no_proxy="admin,polaris-adminvm-01,localhost,*.cm.polaris.alcf.anl.gov,polaris-*,*.polaris.alcf.anl.gov,*.alcf.anl.gov"
    fi

    # setup environment
    source <(curl -L https://bit.ly/ezpz-utils) && ezpz_setup_env

    # install ezpz
    uv pip install --no-cache --link-mode=copy "git+https://github.com/saforem2"

    # test distributed functionality
    ezpz launch python3 -m ezpz.examples.test

    # launch FSDP + TP example:
    ezpz launch python3 -m ezpz.examples.fsdp_tp
    ```

    <details closed><summary><code>ezpz.examples.fsdp_tp --help</code></summary>

    ```bash
    ; python3 -m ezpz.examples.fsdp_tp --help
    usage: fsdp_tp.py [-h] [--dim DIM] [--n-layers N_LAYERS] [--n-heads N_HEADS] [--n-kv-heads N_KV_HEADS] [--multiple-of MULTIPLE_OF]
                      [--ffn-dim-multiplier FFN_DIM_MULTIPLIER] [--hidden-dim HIDDEN_DIM] [--rope-theta ROPE_THETA] [--norm-eps NORM_EPS]
                      [--vocab-size VOCAB_SIZE] [--lr LR] [--epochs EPOCHS] [--batch-size BATCH_SIZE] [--model MODEL]
                      [--test-batch-size TEST_BATCH_SIZE] [--num-workers NUM_WORKERS] [--seed SEED] [--tp TP] [--dp-replicate DP_REPLICATE]
                      [--dp-shard DP_SHARD] [--reshard-after-forward [{always,never}]] [--no-reshard-after-forward]
                      [--activation-checkpoint {none,block,full,selective}] [--meta-init {auto,on,off}] [--max-grad-norm MAX_GRAD_NORM]
                      [--outdir OUTDIR] [--ckpt-dir CKPT_DIR] [--save-interval SAVE_INTERVAL] [--train-iters TRAIN_ITERS] [--no-resume]
                      [--async-ckpt] [--ckpt-stage-dir CKPT_STAGE_DIR] [--dataset DATASET] [--tokenizer_name TOKENIZER_NAME] [--hf-split HF_SPLIT]
                      [--hf-text-column HF_TEXT_COLUMN] [--hf-limit HF_LIMIT] [--seq-len SEQ_LEN] [--max-seq-len MAX_SEQ_LEN] [--fp32] [--compile]
                      [--compile-mode {default,reduce-overhead,max-autotune}] [--act-mem-budget ACT_MEM_BUDGET]
                      [--loss-impl {eager,chunked,chunked-backward,compiled,loss-parallel,fused-linear}] [--loss-chunk-size LOSS_CHUNK_SIZE]
                      [--pyinstrument-profiler] [-p] [--rank-zero-only] [--pytorch-profiler-wait PYTORCH_PROFILER_WAIT]
                      [--pytorch-profiler-warmup PYTORCH_PROFILER_WARMUP] [--pytorch-profiler-active PYTORCH_PROFILER_ACTIVE]
                      [--pytorch-profiler-repeat PYTORCH_PROFILER_REPEAT] [--profile-memory | --no-profile-memory]
                      [--record-shapes | --no-record-shapes] [--with-stack | --no-with-stack] [--with-flops | --no-with-flops]
                      [--with-modules | --no-with-modules] [--acc-events]
    
    2D Parallel Training
    
    options:
      -h, --help            show this help message and exit
      --dim DIM             Model hidden / embedding dimension (a.k.a. d_model). Overridden when --model selects a preset. (default: 256)
      --n-layers N_LAYERS   Number of TransformerBlocks stacked in the model. Overridden when --model selects a preset. (default: 32)
      --n-heads N_HEADS     Number of attention heads per layer. Must divide --dim. Overridden when --model selects a preset. (default: 32)
      --n-kv-heads N_KV_HEADS
                            Number of key/value heads for grouped-query attention (GQA). Must divide --n-heads. Set equal to --n-heads for
                            standard MHA. Overridden when --model selects a preset. (default: 4)
      --multiple-of MULTIPLE_OF
                            Round the SwiGLU FFN hidden dim up to a multiple of this value (for hardware-friendly shapes). Ignored when --hidden-
                            dim is set explicitly. (default: 360)
      --ffn-dim-multiplier FFN_DIM_MULTIPLIER
                            Scale factor applied to the SwiGLU FFN hidden dim before the --multiple-of rounding step. None (default) means no
                            extra scaling; Llama2-style models use 1.3. Ignored when --hidden-dim is set explicitly. (default: None)
      --hidden-dim HIDDEN_DIM
                            Override SwiGLU FFN hidden dim. When None (default), TransformerBlock derives it as `4 * dim` and FeedForward applies
                            the 2/3 + ffn_dim_multiplier + multiple_of pipeline. Set this to a concrete value (e.g. 11008 for agpt-2b, 14336 for
                            agpt-20b) to bypass the formula and hit a published architecture exactly. (default: None)
      --rope-theta ROPE_THETA
                            Base frequency for RoPE positional embeddings. Llama1/2 used 10000 (the default); Llama3 uses 500000; agpt-2b uses
                            50000. (default: 10000.0)
      --norm-eps NORM_EPS   Epsilon added to RMSNorm denominators for numerical stability. (default: 1e-05)
      --vocab-size VOCAB_SIZE
                            Tokenizer vocabulary size. Sets the embedding table and output projection sizes; must match the tokenizer used for the
                            dataset. (default: 32000)
      --lr LR               Peak learning rate for the AdamW optimizer. (default: 0.003)
      --epochs EPOCHS       Number of passes over the training dataset. (default: 5)
      --batch-size BATCH_SIZE
                            Per-DP-rank training batch size (a.k.a. micro-batch). Global batch = --batch-size * (world_size / --tp). (default: 1)
      --model MODEL         Model size preset (overrides dim/layer defaults). Presets: debug/small/medium/large/xl/xxl/xxxl/agpt-2b/agpt-20b.
                            xl/xxl/xxxl accept long-form aliases (`xlarge`/`extra-large`, etc). agpt presets accept `agpt2b`/`agpt_2b` etc. Pass a
                            HuggingFace repo id with a `/` (e.g. `meta-llama/Llama-3.2-1B`) to load HF weights instead — that path forces --tp 1
                            (FSDP-only). (default: None)
      --test-batch-size TEST_BATCH_SIZE
                            Per-DP-rank batch size for the eval/test loader. Only consumed by the MNIST data path; ignored for random and HF
                            datasets. (default: 1000)
      --num-workers NUM_WORKERS
                            Subprocess workers for the DataLoader. 0 (default) loads in-process — fine for tokenized HF datasets; bump for image
                            pipelines or heavy on-the-fly preprocessing. (default: 0)
      --seed SEED           Seed for torch/numpy/python RNGs (forwarded to ezpz.setup_torch). None (default) leaves the RNGs unseeded for non-
                            deterministic runs. (default: None)
      --tp TP               Tensor-parallel degree (a.k.a. TP / Megatron-style sharding). Must divide WORLD_SIZE. The remaining dimension
                            (WORLD_SIZE / --tp) is used for FSDP data parallelism. Set to 1 for FSDP-only. Forced to 1 when --model is a HF repo
                            id. (default: 2)
      --dp-replicate DP_REPLICATE
                            Data-parallel REPLICATE degree (HSDP outer dim). Weights are replicated across this many groups; within each group
                            they are sharded across --dp-shard ranks. Default 1 = no replication (pure FSDP sharding, i.e. today's behavior). Set
                            >1 for HSDP (e.g. shard within a node, replicate across nodes). Mirrors torchtitan's data_parallel_replicate_degree.
                            Constraint: dp_replicate * dp_shard * tp == WORLD_SIZE. (default: 1)
      --dp-shard DP_SHARD   Data-parallel SHARD degree (FSDP inner dim). Weights are sharded across this many ranks within each replicate group.
                            Default -1 = 'use all remaining ranks' = WORLD_SIZE / (dp_replicate * tp), which reproduces today's flat data-parallel
                            behavior. Mirrors torchtitan's data_parallel_shard_degree. (default: -1)
      --reshard-after-forward [{always,never}]
                            FSDP2 reshard_after_forward policy (memory vs. comm tradeoff). `always` (default, ZeRO-3): reshard params after
                            forward — lowest memory, re-all-gathers params in backward. `never` (ZeRO-2): keep params gathered after forward —
                            more memory, skips the backward all-gather. Bare `--reshard-after-forward` == `always`; `--no-reshard-after-forward`
                            == `never`. For HSDP (replicate + shard) use --dp-replicate / --dp-shard. (default: always)
      --no-reshard-after-forward
                            Alias for --reshard-after-forward never (ZeRO-2). (default: None)
      --activation-checkpoint {none,block,full,selective}, --ac {none,block,full,selective}
                            Activation checkpointing strategy. `none` (default) keeps all forward activations in memory. `block` (alias: `full`)
                            wraps each TransformerBlock — typical 30-40 pct activation memory reduction, ~20 pct throughput hit (matches
                            torchtitan's default for agpt-2b/agpt-20b). `selective` checkpoints only the attention computation inside each block —
                            ~15-20 pct memory reduction, ~10 pct throughput hit. Trade activation memory for recomputation cost — useful when OOM-
                            ing during training (NOT during init; for init-time OOM consider increasing --tp or reducing --seq-len). NOTE: cannot
                            be combined with --compile (upstream AOTAutograd DeviceMesh-in-saved-tensors bug — see the --compile warning). With
                            FSDP2 you usually don't need --ac anyway; it was a workaround for the FSDP1 backward-memory OOM that FSDP2 fixes.
                            (default: none)
      --meta-init {auto,on,off}
                            Build the native Transformer on the `meta` device, then materialize only each rank's shard after FSDP2 sharding
                            (torchtitan pattern). Avoids the OOM from moving the full dense model onto one device before sharding, which otherwise
                            caps model size at what fits whole on a single GPU (~2-8B) regardless of node count. `auto` (default) enables it for
                            large native models (>= ~6B params) and keeps small models on the exact dense init path (bit-for-bit reproducible);
                            `on` forces it for any native model; `off` forces the legacy dense path. Ignored for HF `from_pretrained` models (they
                            load real pretrained weights). Override the auto threshold with EZPZ_META_INIT_MIN_PARAMS. (default: auto)
      --max-grad-norm MAX_GRAD_NORM
                            Clip gradients to this L2 norm before the optimizer step. Set to 0 (or negative) to disable gradient clipping.
                            (default: 1.0)
      --outdir OUTDIR       Base directory for metrics logs + the History report. None (default) writes under the current working directory.
                            (Model checkpoints go to --ckpt-dir, not here.) (default: None)
      --ckpt-dir CKPT_DIR, --ckpt_dir CKPT_DIR
                            Directory for DCP (sharded) checkpoints. When set, enables checkpoint save (see --save-interval) AND auto-resume: on
                            startup the latest complete checkpoint here is loaded and training continues from it (unless --no-resume). This is
                            what makes `ezpz launch --auto-retry` resume across attempts. (default: None)
      --save-interval SAVE_INTERVAL, --save_interval SAVE_INTERVAL
                            Save a checkpoint every N optimizer steps (requires --ckpt-dir). 0 (default) disables saving. (default: 0)
      --train-iters TRAIN_ITERS, --train_iters TRAIN_ITERS
                            Stop after N optimizer steps, regardless of --epochs. 0 (default) runs the full --epochs pass. Step-based cap for
                            fixed-length runs / restart-time experiments. (default: 0)
      --no-resume           Ignore any existing checkpoint in --ckpt-dir and start fresh (step 0). Default behavior auto-resumes from the latest.
                            (default: False)
      --async-ckpt, --async_ckpt
                            Save checkpoints asynchronously: stage to fast node-local --ckpt-stage-dir (background thread, overlaps training),
                            then fan out to the durable --ckpt-dir on shared FS. Requires --ckpt-dir. Resume is unchanged (always from --ckpt-
                            dir). (default: False)
      --ckpt-stage-dir CKPT_STAGE_DIR, --ckpt_stage_dir CKPT_STAGE_DIR
                            Node-local staging dir for --async-ckpt (default /tmp/ezpz-ckpt-<jobid>). Transient — NOT resumable on its own; only
                            the fanned-out --ckpt-dir copy is durable. (default: None)
      --dataset DATASET     Training dataset. Special values: `mnist` (image debug dataset) and `random` (synthetic tokens, no IO). Anything else
                            is treated as a HuggingFace dataset repo id. (default: eliplutchok/fineweb-small-sample)
      --tokenizer_name TOKENIZER_NAME
                            HuggingFace tokenizer repo id used to tokenize the HF dataset. Auto-overridden to --model when --model is a HF repo id
                            and --tokenizer_name wasn't passed explicitly. (default: meta-llama/llama-2-7b-hf)
      --hf-split HF_SPLIT, --hf_split HF_SPLIT
                            Dataset split to load. (default: train)
      --hf-text-column HF_TEXT_COLUMN, --hf_text_column HF_TEXT_COLUMN
                            Column containing raw text in the dataset. (default: text)
      --hf-limit HF_LIMIT, --hf_limit HF_LIMIT
                            Maximum number of rows to sample from the HF dataset. 0 (default) = no limit (use the full dataset). Pass a positive
                            value (e.g. `--hf-limit 512`) to subsample for smoke tests. Subsampling is deterministic given $EZPZ_HF_SAMPLE_SEED.
                            (default: 0)
      --seq-len SEQ_LEN     Training sequence length (tokens per sample). Defaults to $SEQ_LEN if set, otherwise 1024. Must be <= --max-seq-len.
                            (default: 1024)
      --max-seq-len MAX_SEQ_LEN
                            Maximum sequence length the model is built to support — sets the RoPE frequency table size and the attention scratch
                            budget. Increase if you raise --seq-len. (default: 32768)
      --fp32                Disable mixed precision (use fp32) for debugging NaNs. (default: False)
      --compile             Compile each TransformerBlock with torch.compile after FSDP/TP wrap (matches torchtitan's apply_compile pattern). Per-
                            block compile dodges the Dynamo + DTensor _MaskPartial graph break that whole-model compile hits on TP-wrapped
                            tok_embeddings, and amortizes compile cost across N layers. (default: False)
      --compile-mode {default,reduce-overhead,max-autotune}
                            torch.compile mode (only used when --compile is set). `default` is safest. `reduce-overhead` enables cudagraphs for
                            small models / large batches. `max-autotune` does extensive kernel search — slow startup, fastest steady state.
                            (default: default)
      --act-mem-budget ACT_MEM_BUDGET
                            Activation-memory budget for the inductor min-cut partitioner (sets torch._functorch.config.activation_memory_budget).
                            Only takes effect with --compile. 1.0 (default) saves ALL activations (no recompute); lower values let the compiler
                            recompute activations in backward to cut peak memory — e.g. 0.5 keeps ~half. This is how torchtitan fits larger
                            batches for the same model (its MemoryBudgetAC sets 0.5). Try 0.5 if you OOM in backward at a batch size that should
                            fit. (default: 1.0)
      --loss-impl {eager,chunked,chunked-backward,compiled,loss-parallel,fused-linear}
                            Cross-entropy implementation. The large-vocab output path is the memory bottleneck: a full (B*T, vocab) fp32 logits
                            tensor + its grad (agpt-2b 256K vocab, seq=8192, bs=2: ~16.8 GiB EACH) can OOM a GPU tile
                            (UR_RESULT_ERROR_OUT_OF_RESOURCES) even when the model fits. Pick by what you need (numbers = measured agpt-2b tp=1):
                            • `eager` (default): plain F.cross_entropy on full logits. Simplest; OOMs at agpt-2b bs2/seq8192. Use for small
                            vocab/seq. • `chunked`: chunks only the FORWARD (--loss-chunk-size). Does NOT bound backward; still OOMs at large
                            vocab. Rarely useful. • `chunked-backward`: custom autograd Function that also bounds the backward graph (recomputes
                            each chunk's grad), saving ~one full logits buffer vs eager. General + model-agnostic (works for HF models, no
                            torch.compile needed) — good at MODERATE vocab/seq or when compile is unavailable. Still holds two logit-sized
                            buffers, so it does NOT fix the very-large-vocab OOM (use fused-linear/compiled there). • `compiled`: torch.compile
                            fuses log_softmax+NLL+backward so the full transient is never materialized (torchtitan's approach). Fits (~45 GB) and
                            is the FASTEST that fits (~28% MFU). Needs working torch.compile. Best default when it fits. • `fused-linear`
                            (Liger/Cut-CE): runs the output projection per row-chunk so the full (B*T,vocab) logits/grad are NEVER built — bounds
                            BOTH row and vocab dims. LOWEST memory (~32 GB, below compiled) at ~24% MFU; trades a little speed for headroom
                            (bigger batch/seq). ezpz Transformer + tp=1 only (HF / tp>1 fall back to compiled). • `loss-parallel`: vocab-parallel
                            CE sharding the vocab across TP ranks (each holds vocab/tp) via TP all-reduces. Bounds the VOCAB dim; only helps at
                            tp>1 (at tp=1 falls back to eager). At tp>1 it is also the only correct path (plain CE hits a Tensor/DTensor mismatch
                            on Replicate logits). ~23 GB/rank, ~34% MFU at tp=2. NOTE: `--compile` only compiles the transformer blocks, NOT the
                            loss, so it does NOT by itself fix the loss transient — use --loss-impl for that. (default: eager)
      --loss-chunk-size LOSS_CHUNK_SIZE
                            Row-chunk size (number of (B*T) token rows per cross-entropy chunk) for --loss-impl=chunked, chunked-backward, and
                            fused-linear. Smaller = lower peak memory, more kernel launches. Ignored for eager/compiled/loss-parallel. (default:
                            1024)
      --pyinstrument-profiler
                            Profile the training loop (default: False)
      -p, --profile         Use PyTorch profiler (default: False)
      --rank-zero-only      Run profiler only on rank 0 (default: False)
      --pytorch-profiler-wait PYTORCH_PROFILER_WAIT
                            Wait time before starting the PyTorch profiler (default: 1)
      --pytorch-profiler-warmup PYTORCH_PROFILER_WARMUP
                            Warmup iterations for the PyTorch profiler (default: 2)
      --pytorch-profiler-active PYTORCH_PROFILER_ACTIVE
                            Active iterations for the PyTorch profiler (default: 3)
      --pytorch-profiler-repeat PYTORCH_PROFILER_REPEAT
                            Repeat iterations for the PyTorch profiler (default: 5)
      --profile-memory, --no-profile-memory
                            Profile memory usage (default: True)
      --record-shapes, --no-record-shapes
                            Record shapes in the profiler (default: True)
      --with-stack, --no-with-stack
                            Include stack traces in the profiler (default: True)
      --with-flops, --no-with-flops
                            Include FLOPs in the profiler (default: True)
      --with-modules, --no-with-modules
                            Include module information in the profiler (default: True)
      --acc-events          Accumulate events in the profiler (default: False)
    [2026-08-03-094107] Command: python3 -m ezpz.examples.fsdp_tp --help
    took: 19 s.
    ```

    </details>
