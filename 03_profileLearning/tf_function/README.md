# TF Function and Graph Compilation

Using line profiler showed us that the largest computation use, by far, was the train loop and is subcalls.  Here, we'll wrap those functions in `@tf.function` decorators to improve performance with graph compilation. Additionally, some of the operations have to be re-written to stay entirely within the TensorFlow library and not use NumPy calls.

This has a mild overhead at the start for tracing but then runs more quickly.  Observe how the first few iterations are slower:
```
python train_MNIST_tf_function.py --epochs 1
```
Out of the box, we see a dramatic speed up:
```
2021-08-10 01:46:46,371 - INFO - (0, 923), Loss: 0.001, step_time: 0.001, throughput: 74358.852 img/s.
2021-08-10 01:46:46,372 - INFO - (0, 924), Loss: 0.000, step_time: 0.001, throughput: 74030.738 img/s.
2021-08-10 01:46:46,374 - INFO - (0, 925), Loss: 0.000, step_time: 0.001, throughput: 66296.729 img/s.
2021-08-10 01:46:46,375 - INFO - (0, 926), Loss: 0.123, step_time: 0.001, throughput: 74379.456 img/s.
2021-08-10 01:46:46,377 - INFO - (0, 927), Loss: 0.035, step_time: 0.001, throughput: 67480.004 img/s.
2021-08-10 01:46:46,378 - INFO - (0, 928), Loss: 0.040, step_time: 0.001, throughput: 73847.443 img/s.
2021-08-10 01:46:46,380 - INFO - (0, 929), Loss: 0.017, step_time: 0.001, throughput: 73564.115 img/s.
2021-08-10 01:46:46,381 - INFO - (0, 930), Loss: 0.000, step_time: 0.001, throughput: 71335.492 img/s.
2021-08-10 01:46:46,383 - INFO - (0, 931), Loss: 0.007, step_time: 0.001, throughput: 71985.909 img/s.
2021-08-10 01:46:46,384 - INFO - (0, 932), Loss: 0.268, step_time: 0.001, throughput: 72354.570 img/s.
2021-08-10 01:46:46,385 - INFO - (0, 933), Loss: 0.443, step_time: 0.001, throughput: 73282.953 img/s.
2021-08-10 01:46:46,387 - INFO - (0, 934), Loss: 0.047, step_time: 0.001, throughput: 74214.945 img/s.
2021-08-10 01:46:46,388 - INFO - (0, 935), Loss: 0.011, step_time: 0.001, throughput: 74153.441 img/s.
```

Instead of 230 Img/s, we're at 74,000 Img/s.  But note that the step time is now only 0.001 seconds.  We're likely not doing enough work per batch.  Increase the batch size from 64 to 1024 or 2048:
```
python train_MNIST_tf_function.py --epochs 1 --batch_size 1024
```
Which yields:
```
2021-08-10 01:44:13,671 - INFO - (0, 29), Loss: 0.158, step_time: 0.001, throughput: 1099582.001 img/s.
2021-08-10 01:44:13,679 - INFO - (0, 30), Loss: 0.202, step_time: 0.001, throughput: 1085958.861 img/s.
2021-08-10 01:44:13,686 - INFO - (0, 31), Loss: 0.172, step_time: 0.001, throughput: 1093980.463 img/s.
2021-08-10 01:44:13,694 - INFO - (0, 32), Loss: 0.140, step_time: 0.001, throughput: 1093423.446 img/s.
2021-08-10 01:44:13,701 - INFO - (0, 33), Loss: 0.117, step_time: 0.001, throughput: 1087608.837 img/s.
2021-08-10 01:44:13,709 - INFO - (0, 34), Loss: 0.120, step_time: 0.001, throughput: 1074278.963 img/s.
2021-08-10 01:44:13,716 - INFO - (0, 35), Loss: 0.140, step_time: 0.001, throughput: 1052172.292 img/s.
2021-08-10 01:44:13,724 - INFO - (0, 36), Loss: 0.184, step_time: 0.001, throughput: 1062584.685 img/s.
2021-08-10 01:44:13,731 - INFO - (0, 37), Loss: 0.108, step_time: 0.001, throughput: 1053721.123 img/s.
2021-08-10 01:44:13,739 - INFO - (0, 38), Loss: 0.112, step_time: 0.001, throughput: 1064691.942 img/s
```

We also can enable [XLA Fusion](https://www.tensorflow.org/xla) (for GPU or CPU) to speed up the computations by fusing small ops together.  

XLA can be enabled (for code within `tf.function` sections) without any changes to your code by setting an environment variable on the command line:
`TF_XLA_FLAGS=--tf_xla_auto_jit=2 python train_MNIST_tf_function.py --epochs 1 --batch_size 1024`
This examines your `tf.function()` decorated functions and automatically decides if/how to cluster them in XLA operations.
> A simple way to start using XLA in TensorFlow models without any changes is to enable auto-clustering, which automatically finds clusters (connected subgraphs) within the TensorFlow functions which can be compiled and executed using XLA. 

Or, XLA can be manually enabled by explicitly setting `@tf.function(jit_compile=True)` for the desired functions. This option was formerly called `experimental_compile` (before TensorFlow v2.5.0). Try:
```
python train_MNIST_tf_function_XLA.py --epochs 1 --batch_size 1024
```

In this case, XLA actually **harms performance** as our training throughput drops to 650k images/second:
```
2021-08-10 01:55:04,462 - INFO - (0, 10), Loss: 0.381, step_time: 0.002, throughput: 643248.060 img/s.
2021-08-10 01:55:04,470 - INFO - (0, 11), Loss: 0.500, step_time: 0.002, throughput: 646929.853 img/s.
2021-08-10 01:55:04,478 - INFO - (0, 12), Loss: 0.506, step_time: 0.002, throughput: 652929.051 img/s.
2021-08-10 01:55:04,486 - INFO - (0, 13), Loss: 0.371, step_time: 0.002, throughput: 646345.718 img/s.
2021-08-10 01:55:04,494 - INFO - (0, 14), Loss: 0.405, step_time: 0.002, throughput: 650752.621 img/s.
2021-08-10 01:55:04,502 - INFO - (0, 15), Loss: 0.296, step_time: 0.002, throughput: 654022.734 img/s.
2021-08-10 01:55:04,510 - INFO - (0, 16), Loss: 0.255, step_time: 0.002, throughput: 651147.255 img/s.
2021-08-10 01:55:04,518 - INFO - (0, 17), Loss: 0.250, step_time: 0.002, throughput: 648982.668 img/s.
2021-08-10 01:55:04,526 - INFO - (0, 18), Loss: 0.195, step_time: 0.002, throughput: 657124.739 img/s.
2021-08-10 01:55:04,534 - INFO - (0, 19), Loss: 0.213, step_time: 0.002, throughput: 653525.152 img/s.
```

As an aside, using a slightly older vesion of TensorFlow in the July 2021 NGC image release leads to a seg-fault when XLA is used on any of the `tf.function` sections other than `compute_loss()`. The generated XLA programs can be dumped with:
```
TF_DUMP_GRAPH_PREFIX=/tmp/generated TF_XLA_FLAGS="--tf_xla_clustering_debug --tf_xla_auto_jit=2" XLA_FLAGS="--xla_dump_hlo_as_text --xla_dump_to=/tmp/generated" python train_MNIST_tf_function.py --epochs 1 --batch_size 1024
```
and are kept for reference in [`xla_bug_generated/`](./xla_bug_generated/). Feel free to try it yourself (and maybe open a bug report in the TensorFlow repository!): 
`/lus/theta-fs0/software/thetagpu/nvidia-containers/tensorflow2/tf2_21.04-py3.simg`

Beyond this, we'll have to run the TensorFlow Profiler.  That is in the next folder, [`tf_profiler/`](../tf_profiler/).
