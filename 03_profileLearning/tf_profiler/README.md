# TF Profiling Tool


Note the lines `tf.profiler.experimental.start('logdir')` and `tf.profiler.experimental.stop()` in the code.  This sets up and tears down the profiling tool built in to TensorFlow.  See the screenshots below - the main operation is conv2D backprop - a very compute heavy operation.  We may get some performance improvement further with reduced precision - see the [`reduced_precision/`](../reduced_precision) folder.


# Running the TensorFlow Profiler

When you've captured your profile data, TensorBoard will dump it into the folder `logdir` (as above) and you will have to view it.  The simplest way, for this application, is to copy it to your own laptop if you have TensorFlow installed.  If not, you can run TensorBoard on ThetaGPU and use SSH port forwarding to view it on your own laptop.

Whatever you do, you can open TensorBoard like so:
```
tensorboard --load_fast=false --logdir [your/own/path/to/logdir/]
```
For my local macOS system with TensorFlow 2.5.0, TensorBoard did not show any data unless the experimntal fast loading logic (which theoretically offers 100x-400x shorter loading times) was disabled. See  https://github.com/tensorflow/tensorboard/issues/4784

Next, open your browser and navigate to `localhost:6006` (or, whatever port you forwarded to) and you'll see a screen like the one below:

![TensorBoard Profiler Overview](./images/profiler_overview.png)

And, if you scroll down, you'll see the list of the top 10 most time consuming operations:

![top 10](./images/top10_ops.png)

This list shows us that the top operations are largely all convolution ops (particularly backprop).  The profiler at the top also points out that 0% of the graph is in reduced precision, which could give us a speedup.  We'll try that next but first let's review the other tabs:

Here is the Kernel Statistics page:

![kernel stats](./images/kernel-stats.png)

Again, this shows that the convolution operations are all the most dominant and equally distributed (roughly).

The TensorFlow statistics shows similar info:

![tf stats](./images/tf-stats.png)

And there is also a timeline view of all ops (trace viewer)

![timeline](./images/trace-viewer.png)

And zoomed:

![timeline zoom](./images/trace-viewer-zoom.png)

Now, let's try running in reduced precision.
