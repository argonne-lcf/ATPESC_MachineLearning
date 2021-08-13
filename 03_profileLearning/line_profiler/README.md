# Line-by-Line profiling

# Installation
 
Line profiler is, unfortunately, not part of the standard Python installation.  It's also not built into the container.  Typically you can install it with `pip install line_profiler`. But on the ThetaGPU compute nodes, this doesn't work - they can't pull down the package.  You also need a place to install it, since you're running in a container for this application.

The easiest way to get around this is to log in to the Theta log in nodes (`theta.alcf.anl.gov`).  Start up an interactive version of the container we'll use in this tutorial:

```bash
singularity exec --nv -B /lus /lus/theta-fs0/software/thetagpu/nvidia-containers/tensorflow2/tf2_21.07-py3.simg bash
# Install line profiler into your user directory:
pip install --user line_profiler
```

With this solution, you will have to use `~/.local/bin/kernprof` below as the executable. 

# Using `line_profiler`
The first, and most easily accessible, profiling tool, is the line profiling tool.

Run the profiling tool using `kernprof` instead of python.  This is only for single-node performance.  For example:
```bash
kernprof -l train_MNIST.py --epochs 1
```

(or, `~/.local/bin/kernprof -l train_MNIST.py`)

This will dump the output for 3 functions, the biggest compute users, into a file `train_MNIST.py.lprof`.  Let's dump out the line by line calls:

```bash
python -m line_profiler train_MNIST.py.lprof
```

First, we see that the main training function is 261 seconds, but nearly 99% of the runtime is spent in the training loop.  The initialization overhead is very small.

```
Total time: 261.261 s
File: train_MNIST.py
Function: train_network at line 168

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
   168                                           @profile
   169                                           def train_network(_batch_size, _training_iterations, _lr, global_s
ize):
   170
   171         1    3574368.0 3574368.0      1.4      mnist_model = MNISTClassifier()
   172
   173         1        206.0    206.0      0.0      opt = tf.keras.optimizers.Adam(_lr)
   174
   175         1          2.0      2.0      0.0      if global_size != 1:
   176                                                   hvd.broadcast_variables(mnist_model.variables, root_rank=0
)
   177                                                   hvd.broadcast_variables(opt.variables(), root_rank=0)
   178
   179         1  257686288.0 257686288.0     98.6      train_loop(_batch_size, _training_iterations, mnist_model,
opt, global_size)  
```


Digging into the `train_loop` function, most of our time is spent in the `forward_pass` function so let's dig there too

```
Total time: 257.665 s
File: train_MNIST.py
Function: train_loop at line 134

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
   134                                           @profile
   135                                           def train_loop(batch_size, n_training_epochs, model, opt, global_s
ize):
   136
   137         1         11.0     11.0      0.0      logger = logging.getLogger()
   138
   139         1         23.0     23.0      0.0      rank = hvd.rank()
   140         2          5.0      2.5      0.0      for i_epoch in range(n_training_epochs):
   141
   142         1          3.0      3.0      0.0          epoch_steps = int(60000/batch_size)
   143
   144       938       2143.0      2.3      0.0          for i_batch in range(epoch_steps):
   145
   146       937       3520.0      3.8      0.0              start = time.time()
   147
   148       937      11951.0     12.8      0.0              with tf.GradientTape() as tape:
   149       937  251482058.0 268390.7     97.6                  loss = forward_pass(model, batch_size)
   150
   151       937       1749.0      1.9      0.0              if global_size != 1:
   152                                                           tape = hvd.DistributedGradientTape(tape)
   153
   154       937     110062.0    117.5      0.0              trainable_vars = model.trainable_variables
   155
   156                                                       # Apply the update to the network (one at a time):
   157       937    2952450.0   3151.0      1.1              grads = tape.gradient(loss, trainable_vars)
   158
   159       937    2797050.0   2985.1      1.1              opt.apply_gradients(zip(grads, trainable_vars))
   160
   161       937       5769.0      6.2      0.0              end = time.time()
   162
   163       937       1720.0      1.8      0.0              images = batch_size*global_size
   164
   165       937     296128.0    316.0      0.1              logger.info(f"({i_epoch}, {i_batch}), Loss: {loss:.3f}
, step_time: {end-start :.3f}, throughput: {images/(end-start):.3f} img/s.")
```


And in forward_pass, we see that almost all the time is fetching the real data!
```
Total time: 251.456 s
File: train_MNIST.py
Function: forward_pass at line 126

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
   126                                           @profile
   127                                           def forward_pass(model, batch_size):
   128       937  243340007.0 259701.2     96.8      batch_data, y_true = fetch_batch(batch_size)
   129       937    6386200.0   6815.6      2.5      y_pred = model(batch_data)
   130       937    1727851.0   1844.0      0.7      loss = compute_loss(y_true, y_pred)
   131       937       1869.0      2.0      0.0      return loss
```


What's in that function?
```python
def fetch_batch(_batch_size):
    x_train, x_test, y_train, y_test = get_dataset()

    indexes = numpy.random.choice(a=x_train.shape[0], size=[_batch_size,])

    images = x_train[indexes].reshape(_batch_size, 28, 28, 1)
    labels = y_train[indexes].reshape(_batch_size, 1)

    return images, labels
```

Well, we call the `get_dataset()` function every time!  If we make the dataset a global variable that we read from instead of reloading it, we should get a big improvement. Run the new version of the training code, which adopts this change:
```
kernprof -l train_MNIST_iofix.py --epochs 1
```

```
2021-08-02 22:00:31,687 - INFO - (0, 541), Loss: 0.161, step_time: 0.009, throughput: 6839.120 img/s.
2021-08-02 22:00:31,697 - INFO - (0, 542), Loss: 0.202, step_time: 0.009, throughput: 6859.217 img/s.
2021-08-02 22:00:31,708 - INFO - (0, 543), Loss: 0.061, step_time: 0.009, throughput: 6818.967 img/s.
2021-08-02 22:00:31,718 - INFO - (0, 544), Loss: 0.248, step_time: 0.009, throughput: 6865.181 img/s.
2021-08-02 22:00:31,728 - INFO - (0, 545), Loss: 0.129, step_time: 0.009, throughput: 6853.263 img/s.
2021-08-02 22:00:31,738 - INFO - (0, 546), Loss: 0.015, step_time: 0.009, throughput: 6852.738 img/s.
2021-08-02 22:00:31,748 - INFO - (0, 547), Loss: 0.101, step_time: 0.009, throughput: 6837.900 img/s.
2021-08-02 22:00:31,758 - INFO - (0, 548), Loss: 0.008, step_time: 0.009, throughput: 6862.724 img/s.
2021-08-02 22:00:31,768 - INFO - (0, 549), Loss: 0.056, step_time: 0.009, throughput: 6838.075 img/s.
```

Even with the profiler still running, we're at nearly 7000 Img/s - a 30x improvement!

We'll pick up again in the [`tf_function/`](../tf_function) folder.  But first, here's a report on the line-by-line profiling of the new script

```
Timer unit: 1e-06 s

Total time: 6.08676 s
File: train_MNIST_iofix.py
Function: forward_pass at line 133

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
   133                                           @profile
   134                                           def forward_pass(model, batch_data, y_true):
   135       937    4970769.0   5305.0     81.7      y_pred = model(batch_data)
   136       937    1114122.0   1189.0     18.3      loss = compute_loss(y_true, y_pred)
   137       937       1874.0      2.0      0.0      return loss

Total time: 12.5605 s
File: train_MNIST_iofix.py
Function: train_loop at line 141

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
   141                                           @profile
   142                                           def train_loop(batch_size, n_training_epochs, model, opt, global_size):
   143                                           
   144         1          5.0      5.0      0.0      logger = logging.getLogger()
   145                                           
   146         1         13.0     13.0      0.0      rank = hvd.rank()
   147         2          6.0      3.0      0.0      for i_epoch in range(n_training_epochs):
   148                                           
   149         1          3.0      3.0      0.0          epoch_steps = int(60000/batch_size)
   150         1        416.0    416.0      0.0          dataset.shuffle(60000) # Shuffle the whole dataset in memory
   151         1        485.0    485.0      0.0          batches = dataset.batch(batch_size=batch_size, drop_remainder=True)
   152                                           
   153       938     380006.0    405.1      3.0          for i_batch, (batch_data, y_true) in enumerate(batches):
   154                                           
   155       937     248650.0    265.4      2.0              batch_data = tf.reshape(batch_data, [-1, 28, 28, 1])
   156                                           
   157       937       3589.0      3.8      0.0              start = time.time()
   158                                           
   159       937       9645.0     10.3      0.1              with tf.GradientTape() as tape:
   160       937    6103210.0   6513.6     48.6                  loss = forward_pass(model, batch_data, y_true)
   161                                           
   162       937       1911.0      2.0      0.0              if global_size != 1:
   163                                                           tape = hvd.DistributedGradientTape(tape)
   164                                           
   165       937     103905.0    110.9      0.8              trainable_vars = model.trainable_variables
   166                                           
   167                                                       # Apply the update to the network (one at a time):
   168       937    2703417.0   2885.2     21.5              grads = tape.gradient(loss, trainable_vars)
   169                                           
   170       937    2673410.0   2853.2     21.3              opt.apply_gradients(zip(grads, trainable_vars))
   171                                           
   172       937       4225.0      4.5      0.0              end = time.time()
   173                                           
   174       937       1889.0      2.0      0.0              images = batch_size*global_size
   175                                           
   176       937     325764.0    347.7      2.6              logger.info(f"({i_epoch}, {i_batch}), Loss: {loss:.3f}, step_time: {end-start :.3f}, throughput: {images/(end-start):.3f} img/s.")

Total time: 12.9817 s
File: train_MNIST_iofix.py
Function: train_network at line 179

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
   179                                           @profile
   180                                           def train_network(_batch_size, _training_iterations, _lr, global_size):
   181                                           
   182         1     396747.0 396747.0      3.1      mnist_model = MNISTClassifier()
   183                                           
   184         1        187.0    187.0      0.0      opt = tf.keras.optimizers.Adam(_lr)
   185                                           
   186         1          2.0      2.0      0.0      if global_size != 1:
   187                                                   hvd.broadcast_variables(mnist_model.variables, root_rank=0)
   188                                                   hvd.broadcast_variables(opt.variables(), root_rank=0)
   189                                           
   190         1   12584764.0 12584764.0     96.9      train_loop(_batch_size, _training_iterations, mnist_model, opt, global_size)

```

As you can see, the dominant calls are the generator, the discriminator (twice), and the gradient calculations.  We will see how to speed those up next with [`tf.function` decorators](../tf_function).
