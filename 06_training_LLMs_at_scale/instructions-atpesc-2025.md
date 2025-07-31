# Instructions for ATPESC Hands-On Tutorial

1. Submit an interactive job:

    ```bash
    # from Aurora login node
    qsub -A <proj> -q prod -l walltime=03:00:00,filesystems=flare:home -l select=2 -I
    ```

2. [From the compute node](https://docs.alcf.anl.gov/aurora/getting-started-on-aurora/#submitting-and-running-jobs):

    ```bash
    # from Aurora compute node (`x4...`)
    
    module load frameworks

    # proxy settings
    if [[ ! "${HOSTNAME}" =~ aurora-uan ]]; then
      export HTTP_PROXY="http://proxy.alcf.anl.gov:3128"
      export HTTPS_PROXY="http://proxy.alcf.anl.gov:3128"
      export http_proxy="http://proxy.alcf.anl.gov:3128"
      export https_proxy="http://proxy.alcf.anl.gov:3128"
      export ftp_proxy="http://proxy.alcf.anl.gov:3128"
      export no_proxy="admin,polaris-adminvm-01,localhost,*.cm.polaris.alcf.anl.gov,polaris-*,*.polaris.alcf.anl.gov,*.alcf.anl.gov"
    fi
    
    git clone https://github.com/saforem2/wordplay
    cd wordplay
    

    # setup environment
    source <(curl -L https://bit.ly/ezpz-utils) && ezpz_setup_env

    python3 -m pip install -e "." --require-virtualenv
    python3 -m pip install deepspeed

    python3 -m pip install wandb
    export WANDB_API_KEY=USE_YOUR_KEY

    # test distributed functionality
    ezpz-test

    python3 data/shakespeare_char/prepare.py
    ezpz-launch -m wordplay \
        train.backend=deepspeed \
        train.eval_interval=100 \
        data=shakespeare \
        train.dtype=bf16 \
        model.batch_size=8 \
        model.block_size=1024 \
        train.max_iters=1000 \
        train.log_interval=10 \
        train.compile=false
    ```
