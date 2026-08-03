# Part 1: Data Parallel Deep Learning with PyTorch DDP

We will experiment with PyTorch DDP using `ddp_example.py`. This could be run during an interactive job using `bash submit_ddp.sh`.

Resources:
- [Documentation for PyTorch on Aurora](https://docs.alcf.anl.gov/aurora/data-science/frameworks/pytorch/)
- [Documentation for PyTorch DDP](https://docs.pytorch.org/docs/2.13/generated/torch.nn.parallel.DistributedDataParallel.html)
- [PyTorch DDP blog post](https://docs.pytorch.org/tutorials/intermediate/ddp_tutorial.html)

# Part 2: PyTorch FSDP + Tensor Parallelism

We will experiment with an example using PyTorch FSDP and tensor parallelism. For simplicity, the example comes from Sam Foreman's [ezpz](https://github.com/saforem2/ezpz) library (`ezpz.examples.fsdp_tp`). This could be run during an interactive job using `bash submit_fsdp_tp.sh`. 

## Creating a custon Python environment on Aurora
Our documentation for how to extend the Python environment provided in the frameworks module is [here](https://docs.alcf.anl.gov/aurora/data-science/python/#virtual-environments-via-venv).
```
python3 -m venv /path/to/new/venv --system-site-packages
source  /path/to/new/venv/bin/activate
pip install ezpz
```

Resources:
- [PyTorch FSDP documentation](https://docs.pytorch.org/docs/2.13/fsdp.html)
- [Pytorch FSDP tutorial](https://docs.pytorch.org/tutorials/intermediate/FSDP_tutorial.html)
- [PyTorch Tensor Parallel tutorial for transformers](https://docs.pytorch.org/tutorials/intermediate/TP_tutorial.html)
- [ezpz website](https://ezpz.cool/)
- [ezpz Github](https://github.com/saforem2/ezpz)