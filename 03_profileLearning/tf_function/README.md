# TF Function and Graph Compilation

Using line profiler showed us that the largest computation use, by far, was the train loop and is subcalls.  Here, we'll wrap those functions in `@tf.function` decorators to improve performance with graph compilation. Additionally, some of the operations have to be re-written to stay entirely within the TensorFlow library and not use NumPy calls.

This has a mild overhead at the start for tracing but then runs more quickly.  Observe how the first few iterations are slower:
```
python train_MNIST_tf_function.py --epochs 1
```
Out of the box, we see a dramatic speed up:
```
2021-08-03 00:35:14,102 - INFO - (0, 0), Loss: 2.310, step_time: 2.831, throughput: 22.610 img/s.
2021-08-03 00:35:14,177 - INFO - (0, 1), Loss: 3.669, step_time: 0.074, throughput: 861.115 img/s.
2021-08-03 00:35:14,199 - INFO - (0, 2), Loss: 2.408, step_time: 0.021, throughput: 2996.467 img/s.
2021-08-03 00:35:14,220 - INFO - (0, 3), Loss: 2.211, step_time: 0.021, throughput: 3117.862 img/s.
2021-08-03 00:35:14,233 - INFO - (0, 4), Loss: 2.207, step_time: 0.012, throughput: 5429.190 img/s.
2021-08-03 00:35:14,245 - INFO - (0, 5), Loss: 2.139, step_time: 0.011, throughput: 5632.183 img/s.
2021-08-03 00:35:14,248 - INFO - (0, 6), Loss: 2.038, step_time: 0.003, throughput: 21025.727 img/s.
2021-08-03 00:35:14,252 - INFO - (0, 7), Loss: 1.964, step_time: 0.003, throughput: 22149.967 img/s.
2021-08-03 00:35:14,255 - INFO - (0, 8), Loss: 1.688, step_time: 0.003, throughput: 22455.702 img/s.
2021-08-03 00:35:14,259 - INFO - (0, 9), Loss: 1.533, step_time: 0.003, throughput: 21360.345 img/s.
2021-08-03 00:35:14,262 - INFO - (0, 10), Loss: 1.170, step_time: 0.003, throughput: 21574.944 img/s.
2021-08-03 00:35:14,266 - INFO - (0, 11), Loss: 0.858, step_time: 0.003, throughput: 21986.687 img/s.
2021-08-03 00:35:14,269 - INFO - (0, 12), Loss: 0.774, step_time: 0.003, throughput: 22026.377 img/s.
2021-08-03 00:35:14,273 - INFO - (0, 13), Loss: 0.812, step_time: 0.003, throughput: 22126.233 img/s.
2021-08-03 00:35:14,276 - INFO - (0, 14), Loss: 0.641, step_time: 0.003, throughput: 22153.624 img/s.
2021-08-03 00:35:14,279 - INFO - (0, 15), Loss: 0.694, step_time: 0.003, throughput: 21950.728 img/s.
2021-08-03 00:35:14,283 - INFO - (0, 16), Loss: 0.892, step_time: 0.003, throughput: 22111.652 img/s.
2021-08-03 00:35:14,286 - INFO - (0, 17), Loss: 0.656, step_time: 0.003, throughput: 22260.175 img/s.
2021-08-03 00:35:14,290 - INFO - (0, 18), Loss: 0.289, step_time: 0.003, throughput: 22347.274 img/s.
2021-08-03 00:35:14,293 - INFO - (0, 19), Loss: 0.808, step_time: 0.003, throughput: 22315.692 img/s.
```

Instead of 230 Img/s, we're at 22000 Img/s.  But note that the step time is now only 0.003 seconds.  We're likely not doing enough work per batch.  Increase the batch size from 64 to 1024 or 2048:
```
python train_MNIST_tf_function.py --epochs 1 --batch_size 1024
```
Which yields:
```
2021-08-03 00:33:25,050 - INFO - (0, 23), Loss: 0.137, step_time: 0.004, throughput: 239527.483 img/s.
2021-08-03 00:33:25,058 - INFO - (0, 24), Loss: 0.153, step_time: 0.004, throughput: 240170.402 img/s.
2021-08-03 00:33:25,067 - INFO - (0, 25), Loss: 0.135, step_time: 0.004, throughput: 238808.301 img/s.
2021-08-03 00:33:25,076 - INFO - (0, 26), Loss: 0.154, step_time: 0.004, throughput: 238781.748 img/s.
2021-08-03 00:33:25,084 - INFO - (0, 27), Loss: 0.148, step_time: 0.004, throughput: 239034.244 img/s.
2021-08-03 00:33:25,093 - INFO - (0, 28), Loss: 0.111, step_time: 0.004, throughput: 239808.336 img/s.
2021-08-03 00:33:25,102 - INFO - (0, 29), Loss: 0.125, step_time: 0.004, throughput: 239487.415 img/s.
2021-08-03 00:33:25,111 - INFO - (0, 30), Loss: 0.157, step_time: 0.004, throughput: 238001.069 img/s.
2021-08-03 00:33:25,119 - INFO - (0, 31), Loss: 0.127, step_time: 0.004, throughput: 238503.293 img/s.
2021-08-03 00:33:25,128 - INFO - (0, 32), Loss: 0.102, step_time: 0.004, throughput: 239835.118 img/s.
2021-08-03 00:33:25,137 - INFO - (0, 33), Loss: 0.092, step_time: 0.004, throughput: 237869.257 img/s.
2021-08-03 00:33:25,146 - INFO - (0, 34), Loss: 0.088, step_time: 0.004, throughput: 238080.227 img/s.
2021-08-03 00:33:25,154 - INFO - (0, 35), Loss: 0.117, step_time: 0.004, throughput: 238119.826 img/s.
```

We also can enable XLA Fusion (for GPU or CPU) to speed up the computations by fusing small ops together.  

XLA can be enabled without any changes to your code by setting an environment variable on the command line:
`TF_XLA_FLAGS=--tf_xla_auto_jit=2 python train_MNIST_tf_function.py --epochs 1 --batch_size 1024`
This examines your `tf.function()` decorated functions and automatically decides if/how to cluster them in XLA operations.
> A simple way to start using XLA in TensorFlow models without any changes is to enable auto-clustering, which automatically finds clusters (connected subgraphs) within the TensorFlow functions which can be compiled and executed using XLA. 

Unfortunately this version of TensorFlow in this Singularity container seg-faults with this option applied to our code. A slightly older version of NGC Container and TensorFlow seems to work; feel free to try: 
`/lus/theta-fs0/software/thetagpu/nvidia-containers/tensorflow2/tf2_21.04-py3.simg`

Or, XLA can be manually enabled by explicitly setting `@tf.function(jit_compile=True)` for the desired functions. This option was formerly called `experimental_compile` (before TensorFlow v2.5.0). Try:
```
python train_MNIST_tf_function_XLA.py --epochs 1 --batch_size 1024
```

This shaves a few milliseconds off the step time and gets us to nearly 200k Img/s:
```
2021-08-03 00:36:14,432 - INFO - (0, 26), Loss: 0.203, step_time: 0.005, throughput: 194730.110 img/s.
2021-08-03 00:36:14,442 - INFO - (0, 27), Loss: 0.157, step_time: 0.005, throughput: 201812.203 img/s.
2021-08-03 00:36:14,452 - INFO - (0, 28), Loss: 0.159, step_time: 0.005, throughput: 193510.579 img/s.
2021-08-03 00:36:14,462 - INFO - (0, 29), Loss: 0.155, step_time: 0.005, throughput: 196818.225 img/s.
2021-08-03 00:36:14,472 - INFO - (0, 30), Loss: 0.227, step_time: 0.005, throughput: 191423.421 img/s.
2021-08-03 00:36:14,481 - INFO - (0, 31), Loss: 0.154, step_time: 0.005, throughput: 191466.088 img/s.
2021-08-03 00:36:14,491 - INFO - (0, 32), Loss: 0.149, step_time: 0.005, throughput: 193145.087 img/s.
2021-08-03 00:36:14,501 - INFO - (0, 33), Loss: 0.126, step_time: 0.005, throughput: 203302.438 img/s.
2021-08-03 00:36:14,511 - INFO - (0, 34), Loss: 0.111, step_time: 0.005, throughput: 192159.961 img/s.
2021-08-03 00:36:14,520 - INFO - (0, 35), Loss: 0.144, step_time: 0.005, throughput: 191116.776 img/s.
2021-08-03 00:36:14,530 - INFO - (0, 36), Loss: 0.174, step_time: 0.005, throughput: 192237.369 img/s.
```

Beyond this, we'll have to run the TensorFlow Profiler.  That is in the next folder, [`tf_profiler/`](../tf_profiler/).
