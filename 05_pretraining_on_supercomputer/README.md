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

    ezpz launch python3 -m ezpz.examples.fsdp_tp
    ```
