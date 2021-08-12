# Data Parallel Deep Learning
Author: Huihuo Zheng (<huihuo.zheng@anl.gov>). 

Examples used in this training are built on top of Bethany Lusch's notebook [03_keras_cnn.ipynb](../01_deepLearning/03_keras_cnn.ipynb)

**Goals of this tutorial**
* Understand model parallelism and data parallelism
* Know how to modify your code with Horovod
* Know how to run distributed training on supercomputer


## I. Introduction to Data Parallel Deep Learning

The goal for train the model at large scale is to reduce the time-to-solution to reasonable amount. By using training the model in parallel, it reduces the total training time from weeks to minutes. 

![acc](./figures/resnet50.png)


### Model Parallelism and Data Parallelism

* **Model parallelization**: in this scheme, disjoint subsets of a neural network are assigned to different devices. All the computations associated to the subsets are performed concurrently. 
	
  Communication happens between devices whenever there is dataflow between two subsets. 
  
  Model parallelization is suitable when the model is too large to be fitted into a single device (CPU/GPU) because of the memory capacity. However, partitioning the model into different subsets is not an easy task, and there might potentially introduce load imbalance issues limiting the scaling efficiency.  

2. **Data parallelization**: in this scheme, all the workers own a replica of the model. The global batch of data is split into multiple minibatches, and processed by different workers. Each worker computes the corresponding loss and gradients with respect to the data it posseses. 
  
  Before the updating of the parameters at each epoch, the loss and gradients are averaged among all the workers through a collective operation. This scheme is relatively simple to implement. MPI_Allreduce is the only commu

![acc](./figures/distributed.png)

Our recent presentation about the data parallel training can be found here: https://youtu.be/930yrXjNkgM

## II. Horovod Data Parallel Frameworks
![Horovod](./figures/Horovod.png)
Reference: https://horovod.readthedocs.io/en/stable/
1. Sergeev, A., Del Balso, M. (2017) Meet Horovod: Uber’s Open Source Distributed Deep Learning Framework for TensorFlow. Retrieved from https://eng.uber.com/horovod/
2. Sergeev, A. (2017) Horovod - Distributed TensorFlow Made Easy. Retrieved from https://www.slideshare.net/AlexanderSergeev4/horovod-distributed-tensorflow-made-easy

3. Sergeev, A., Del Balso, M. (2018) Horovod: fast and easy distributed deep learning in TensorFlow. Retrieved from arXiv:1802.05799

### TensorFlow with Horovod
1) **Initialize Horovod**
```python
import horovod.tensorflow as hvd 
hvd.init()
```
After this initialization, the rank ID and the number of processes can be refered as ```hvd.rank()``` and ```hvd.size()```. Besides, one can also call ```hvd.local_rank()``` to get the local rank ID within a node. This is useful when we are trying to assign GPUs to each rank. 

2) **Assign GPUs to each rank**
```python
# Get the list of GPU
gpus = tf.config.experimental.list_physical_devices('GPU')
# Ping GPU to the rank
tf.config.experimental.set_visible_devices(gpus[hvd.local_rank()], 'GPU')
```
In this case, we set one GPU per process: ID=```hvd.local_rank()```

3) **Scale the learning rate by number of workers**

Typically, since we use multiple workers, if we keep the local batch size on each rank the same, the global batch size increases by $n$ times ($n$ is the number of workers). The learning rate should increase proportionally (assuming that the learning rate initially is 0.01).
```python
opt = tf.train.AdagradOptimizer(0.01*hvd.size())
```

4) **Wrap tf.GradientTape with Horovod Distributed Gradient Tape**

```python
tape = hvd.DistributedGradientTape(tape)
```
So that this can also ```tape``` operator will average the weights and gradients among the workers in the back propagating stage. 

5) **Broadcast the model and optimizer parameters from rank 0**

This is to make sure that all the workers will have the same starting point.
```python
hvd.broadcast_variables(model.variables, root_rank=0)
hvd.broadcast_variables(opt.variables(), root_rank=0)
```

6) **Checkpointing on root rank**

It is important to let only one process to do the checkpointing I/O. 
```python
if hvd.rank() == 0: 
     checkpoint.save(checkpoint_dir)
```

7) **Loading data according to rank ID**

In data parallelism, we distributed the dataset to different workers. It is important to make sure different workers work on different part of the dataset, and they together can cover the entire dataset at each epoch. 

In general, one has two ways to deal with the data loading. 
1. Each worker randomly selects one batch of data from the dataset at each step. In such case, each worker can see the entire dataset. It is important to make sure that the different worker have different random seeds so that they will get different data at each step.
2. Each worker accesses a subset of dataset. One manually partition the entire dataset into different partions, and each rank access one of the partions. 

8) **Adjusting the number of steps per epoch**

The total number of steps per epoch is ```nsamples / hvd.size()```.



We provided some examples in: 
* [03_keras_cnn_verbose_hvd.py](03_keras_cnn_verbose_hvd.py)



### Keras with Horovod
1) **Initialize Horovod**
```python
import horovod.tensorflow.keras as hvd 
hvd.init()
```
After this initialization, the rank ID and the number of processes can be refered as ```hvd.rank()``` and ```hvd.size()```. Besides, one can also call ```hvd.local_rank()``` to get the local rank ID within a node. This is useful when we are trying to assign GPUs to each rank. 

2) **Assign GPUs to each rank**
```python
# Get the list of GPU
gpus = tf.config.experimental.list_physical_devices('GPU')
# Ping GPU to the rank
tf.config.experimental.set_visible_devices(gpus[hvd.local_rank()], 'GPU')
```
In this case, we set one GPU per process: ID=```hvd.local_rank()```

3) **Scale the learning rate with number of workers**

Typically, since we use multiple workers, if we keep the local batch size on each rank the same, the global batch size increases by $n$ times ($n$ is the number of workers). The learning rate should increase proportionally (assuming that the learning rate initially is 0.01).
```python
opt = tf.optimizers.Adam(args.lr * hvd.size())
```

4) **Wrap tf.optimizer with Horovod DistributedOptimizer**

```python
opt = hvd.DistributedOptimizer(opt)
```
So that this optimizer can average the weights and gradients among the workers in the back propagating stage. 

5) **Broadcast the model from rank 0**

This is to make sure that all the workers will have the same starting point.
```python
callbacks = [
        hvd.callbacks.BroadcastGlobalVariablesCallback(0), ...
]

```
6) **Checkpointing on root rank**

It is important to let only one process to do the checkpointing I/O. 
```python
if hvd.rank() == 0:
    callbacks.append(tf.keras.callbacks.ModelCheckpoint('./checkpoints/keras_mnist-{epoch}.h5'))
```

7) **Loading data according to rank ID**

In data parallelism, we distributed the dataset to different workers. It is important to make sure different workers work on different part of the dataset, and they together can cover the entire dataset at each epoch. 

In general, one has two ways to deal with the data loading. 
1. Each worker randomly selects one batch of data from the dataset at each step. In such case, each worker can see the entire dataset. It is important to make sure that the different worker have different random seeds so that they will get different data at each step.
2. Each worker accesses a subset of dataset. One manually partition the entire dataset into different partions, and each rank access one of the partions. 

8) **Adjusting the number of steps per epoch**

The total number of steps per epoch is ```nsamples / hvd.size()```.


We provided some examples in: We provided some examples in: 
* [03_keras_cnn_concise_hvd.py](03_keras_cnn_concise_hvd.py)

### Summary 
  1. Initialize Horovod
  2. Pin GPU to each process
  3. Scale the learning rate
  4. Set distributed optimizer / gradient tape
  5. Broadcast the model & optimizer parameters to other rank
  6. Checking pointing on rank 0
  7. Adjusting dataset loading: number of steps (or batches) per epoch, dataset sharding, etc. 


## III. Evaluating Performance
### Running on ThetaGPU
Request a ThetaGPU node
```bash
ssh -CY user@theta.alcf.anl.gov
ssh -CY thetagpusn1
qsub -q training -I -A ATPESC2021 -t 20 -n 1 --attrs=pubnet
```
Setup the environment
```bash
source /lus/theta-fs0/software/thetagpu/conda/2021-06-26/mconda3/setup.sh
export http_proxy=http://theta-proxy.tmi.alcf.anl.gov:3128
export https_proxy=https://theta-proxy.tmi.alcf.anl.gov:3128
```

Run the example with different number of GPUs
```bash
mpirun -np 1 python 03_keras_cnn_concise_hvd.py >& concise_1.out
mpirun -np 2 python 03_keras_cnn_concise_hvd.py >& concise_2.out
mpirun -np 4 python 03_keras_cnn_concise_hvd.py >& concise_4.out
mpirun -np 8 python 03_keras_cnn_concise_hvd.py >& concise_8.out
```

```bash
concise_1.out:Total time: 13.148040294647217 second
concise_2.out:Total time: 8.65635347366333 second
concise_4.out:Total time: 3.7076730728149414 second
concise_8.out:Total time: 2.2868692874908447 second
```
## IV. MPI Communication
* MPI profiling -- to see the MPI calls involved
   * running on GPU
```bash
  LD_PRELOAD=/soft/perftools/hpctw/lib/libmpitrace.so mpirun -np 8 python 03_keras_cnn_concise_hvd.py --epochs 10
```
  0.09 second per epoch. 

```
Times and statistics from MPI_Init() to MPI_Finalize().
-----------------------------------------------------------------------
MPI Routine                        #calls     avg. bytes      time(sec)
-----------------------------------------------------------------------
MPI_Comm_rank                           5            0.0          0.000
MPI_Comm_size                           3            0.0          0.000
MPI_Bcast                             111       259530.7          0.019
MPI_Barrier                             1            0.0          0.081
MPI_Allreduce                       12506           15.9          5.887
MPI_Gather                             30            4.0          0.006
MPI_Gatherv                            30            0.0          0.000
MPI_Allgather                           2            4.0          0.000
-----------------------------------------------------------------
total communication time = 5.994 seconds.
total elapsed time       = 18.068 seconds.
...
MPI_Allreduce             #calls    avg. bytes      time(sec)
                             102           4.0          0.001
                           12404          16.0          5.885
```


  * running on CPU
```
LD_PRELOAD=/soft/perftools/hpctw/lib/libmpitrace.so mpirun -np 8 python 03_keras_cnn_concise_hvd.py --device cpu --epochs 10
```
2.44 second per epoch
  

```
Times and statistics from MPI_Init() to MPI_Finalize().
-----------------------------------------------------------------------
MPI Routine                        #calls     avg. bytes      time(sec)
-----------------------------------------------------------------------
MPI_Comm_rank                           5            0.0          0.000
MPI_Comm_size                           3            0.0          0.000
MPI_Bcast                             150       192058.6          0.021
MPI_Allreduce                       77340        44324.1        106.664
MPI_Gather                             50            4.0          0.003
MPI_Gatherv                            50            0.0          0.001
MPI_Allgather                           2            4.0          0.000
-----------------------------------------------------------------
total communication time = 106.689 seconds.
total elapsed time       = 128.903 seconds.

...
MPI_Allreduce             #calls    avg. bytes      time(sec)
                             102           4.0          0.001
                           72893          16.0         86.606
                              16          40.0          0.003
                             709         128.0          0.093
                             709         256.0          0.149
                              10         512.0          0.002
                              76         552.0          0.075
                             713        1154.2          0.069
                             684        5607.9          0.645
                             714       73730.2          0.176
                             714     4718824.9         18.844
```

* Horovod Timeline -- to see when MPI communication happens. 
To get the timeline trace, simply set the environment variable ```HOROVOD_TIMELINE``` to the output file name. Then copy the json file to your local machine, and visualize using Chrome trace (open your chrome and type chrome://tracing/ in the address bar, and then load the json file). 
```bash
HOROVOD_TIMELINE=gpu.json mpirun -np 8 python 03_keras_cnn_concise_hvd.py 
HOROVOD_TIMELINE=cpu.json mpirun -np 8 python 03_keras_cnn_concise_hvd.py --device cpu 
```
  - GPU Horovod timeline
  	![GPU timeline](./figures/gpu_horovodtimeline.png)
  - CPU Horovod timeline
	![CPU timeline](./figures/cpu_horovodtimeline.png)
As we can see, that CPU and GPU behaves differently. One GPU, the Allreduce is performed by NCCL backend (Nvidia communication library). 

---------------------------
**To run all the jobs involved in this training all at once**: 
```bash
ssh -CY user@theta.alcf.anl.gov
ssh -CY thetagpusn1
qsub submission/qsub.sc
```