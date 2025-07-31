import dragon
import multiprocessing as mp

import sys
import os
import math
import numpy as np
import torch
from model import Net, infer, train

from dragon.native.process import Process, ProcessTemplate, Popen
from dragon.data.ddict import DDict
from dragon.infrastructure.policy import Policy
from dragon.native.process_group import ProcessGroup
from dragon.native.machine import System, Node
from dragon.infrastructure.facts import PMIBackend



def generate_data(
    dd: DDict, num_ranks_per_node: int, samples_per_rank: int, sample_range: list
) -> None:
    """Launches mpi application that generates (x, sin(x)) pairs uniformly sampled from [sample_range[0], sample_range[1]).

    :param dd: Distributed Dictionary
    :type dd: DDict
    :param num_ranks_per_node: number of ranks per node to use to generate data
    :type num_ranks_per_node: int
    :param samples_per_rank: number of samples to generate per rank
    :type samples_per_rank: int
    :param sample_range: range from which to sample training data
    :type sample_range: list
    """
    """Launch process group and parse data"""
    # Get nodelist and vendor info
    alloc = System()
    nodelist = alloc.nodes
    num_nodes = alloc.nnodes
    vendor = Node(nodelist[0]).gpu_vendor
    if vendor == 'Intel':
        cpu_bind = [1,8,16,24,32,40,48,53,60,68,76,84,92,100]
        num_ranks_per_node = min(len(cpu_bind), num_ranks_per_node)
        launcher = PMIBackend.PMIX
    elif vendor == 'Nvidia':
        cpu_bind = [1,8,16,24]
        num_ranks_per_node = min(len(cpu_bind), num_ranks_per_node)
        launcher = PMIBackend.CRAY
    else:
        cpu_bind = [0]
        num_ranks_per_node = 1
        launcher = None

    # Setup run
    exe = sys.executable
    script = os.path.join(os.getcwd(), "sim-expensive.py")
    args = [script, dd.serialize(), str(samples_per_rank), str(sample_range[0]), str(sample_range[1])]
    run_dir = os.getcwd()

    grp = ProcessGroup(restart=False, pmi=launcher, ignore_error_on_exit=True)
    for node_num in range(num_nodes):
        node_name = Node(nodelist[node_num]).hostname
        for proc in range(num_ranks_per_node):
            local_policy = Policy(placement=Policy.Placement.HOST_NAME,
                                  host_name=node_name, 
                                  cpu_affinity=[cpu_bind[proc]])
            grp.add_process(nproc=1, 
                            template=ProcessTemplate(target=exe, 
                                                     args=args, 
                                                     cwd=run_dir, 
                                                     policy=local_policy))
    
    # start the process group
    grp.init()
    grp.start()
    
    grp.join()
    #grp.stop()
    grp.close()


def compute_cheap_approx(dd: DDict, num_ranks_per_node: int) -> None:
    """Launch process group with cheap approximation and parse output to float as a string

    :param dd: Distributed Dictionary
    :type dd: DDict
    :param num_ranks_per_node: number of mpi ranks (and therefor terms) per node to use for the cheap approximation
    :type num_ranks: int
    
    """
    # Get nodelist and vendor info
    alloc = System()
    nodelist = alloc.nodes
    num_nodes = alloc.nnodes
    vendor = Node(nodelist[0]).gpu_vendor
    if vendor == 'Intel':
        cpu_bind = [1,8,16,24,32,40,48,53,60,68,76,84,92,100]
        num_ranks_per_node = min(len(cpu_bind), num_ranks_per_node)
        launcher = PMIBackend.PMIX
    elif vendor == 'Nvidia':
        cpu_bind = [1,8,16,24]
        num_ranks_per_node = min(len(cpu_bind), num_ranks_per_node)
        launcher = PMIBackend.CRAY
    else:
        cpu_bind = [0]
        num_ranks_per_node = 1
        launcher = None

    # Setup run
    exe = sys.executable
    script = os.path.join(os.getcwd(), "sim-cheap.py")
    args = [script, dd.serialize()]
    run_dir = os.getcwd()

    grp = ProcessGroup(restart=False, pmi=launcher, ignore_error_on_exit=True)
    for node_num in range(num_nodes):
        node_name = Node(nodelist[node_num]).hostname
        for proc in range(num_ranks_per_node):
            local_policy = Policy(placement=Policy.Placement.HOST_NAME,
                                  host_name=node_name, 
                                  cpu_affinity=[cpu_bind[proc]])
            grp.add_process(nproc=1, 
                            template=ProcessTemplate(target=exe, 
                                                     args=args, 
                                                     cwd=run_dir, 
                                                     policy=local_policy))

    # start the process group
    grp.init()
    grp.start()
    
    grp.join()
    #grp.stop()
    grp.close()


def infer_and_compare(dd: DDict, model: torch.nn, device: str) -> tuple:
    """Launch inference and cheap approximation and check the difference between them

    :param dd: Distributed Dictionary
    :type dd: DDict
    :param model: PyTorch model that approximates sin(x)
    :type model: torch.nn
    :param device: device on which to run
    :type device: string
    :return: the model's output val and the difference between it and the cheap approximation value
    :rtype: tuple
    """
    # Get device for inference based on GPU vendor
    alloc = System()
    nodelist = alloc.nodes
    
    # Define Policy for inference
    infer_policy = Policy(placement=Policy.Placement.HOST_NAME,
                          host_name=Node(nodelist[0]).hostname, 
                          cpu_affinity=[4],
                          gpu_affinity=[0])

    # Run inference and cheap approximation concurrently
    inf_proc = Process(target=infer, 
                        args=(dd, model, device), 
                        policy=infer_policy)
    inf_proc.start()

    num_ranks_per_node = 4
    compute_cheap_approx(dd, num_ranks_per_node)
    
    inf_proc.join()

    model_pred = dd['prediction']
    approx = dd['approximation']    
    error = np.mean(np.abs(model_pred - approx))
    return model_pred, error


def main():
    # Set some parameters
    data_interval = [-math.pi, math.pi]
    samples_per_rank = 128
    ranks_per_node = 4

    # Get alloocation info
    alloc = System()
    num_nodes = alloc.nnodes
    nodelist = alloc.nodes
    print(f"DragonHPC running on {num_nodes} nodes:",flush=True)
    print([Node(node).hostname for node in nodelist],"\n",flush=True)
    head_node = Node(nodelist[0])
    vendor = head_node.gpu_vendor
    if vendor == 'Intel':
        device = 'xpu'
    elif vendor == 'Nvidia':
        device = 'cuda'
    else:
        device = 'cpu'
    print(f"Head node is {head_node.hostname}, with:")
    print(f"    num cpus: {head_node.num_cpus}")
    print(f"    num gpus: {head_node.num_gpus}")
    print(f"    device type: {device}")
    print(f"    memory: {head_node.physical_mem/1024/1024/1024} GB")
    print("",flush=True)

    # Initialize the DDict on all the nodes
    ddict_mem_per_node = 0.05 * head_node.physical_mem # dedicate 5% of each node's memory to DDict
    tot_ddict_mem = int(ddict_mem_per_node * num_nodes)
    managers_per_node = 1
    dd = DDict(managers_per_node, num_nodes, tot_ddict_mem)

    # Initialize model and optimizer
    #model_path = "model_pretrained_poly.pt"
    #checkpoint = torch.load(model_path, weights_only=True)
    model = Net()
    #model.load_state_dict(checkpoint["model_state_dict"])
    model.to(device)

    optimizer = torch.optim.Adam(model.parameters(), lr=0.01)
    #optimizer.load_state_dict(checkpoint["optimizer_state_dict"])

    # Train model once before the fine-tune loop
    print("Training model ...")
    generate_data(dd, ranks_per_node, samples_per_rank, data_interval)
    loss = train(dd, model, optimizer, device)
    print(f'Training loss = {loss}',flush=True)

    # Start fine tuning loop
    number_of_times_trained = 0
    successes = 0
    generate_new_x = True
    while successes < 5 and number_of_times_trained < 10:
        # uniformly sample from [-pi, pi) to generate new data
        if generate_new_x:
            x = np.random.rand(32) * (2 * math.pi) - math.pi
            dd['x'] = x

        # Perform model inference and a checp approximation
        model_val, error = infer_and_compare(dd, model, device)

        # Perform training if needed
        if error > 0.1:
            print(f"\nML prediction error is {error}, above tolerance!", flush=True)
            print(f"Launching more training ...", flush=True)
            
            # want to train and then retry same value
            generate_new_x = False
            number_of_times_trained += 1
            
            # Fine tune the model
            generate_data(dd, ranks_per_node, samples_per_rank, data_interval)
            loss = train(dd, model, optimizer, device)
            print(f'Training loss = {loss}',flush=True)
        else:
            successes += 1
            generate_new_x = True
            print(f"\nML prediction error is {error}, below tolerance!", flush=True)


if __name__ == "__main__":
    mp.set_start_method("dragon")
    main()
