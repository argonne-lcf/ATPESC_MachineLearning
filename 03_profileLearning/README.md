# Profiling TensorFlow

_Authors_: Kyle Felker (felker@anl.gov), Corey Adams (corey.adams@anl.gov)



In this example, we'll profile the CNN used to clasify MNIST digits in the previous
exercises. We will complete several rounds of profiling, each time enabling a new tool or
optimization.  At the end of the exercise, you'll have a much faster network.

Find the original script in `train_MNIST.py`.

All the scripts used here work in a Singularity container containing TensorFlow 2.5.0. 

```bash
singularity exec --nv -B /lus /lus/theta-fs0/software/thetagpu/nvidia-containers/tensorflow2/tf2_21.07-py3.simg bash
```

This walkthrough was adapted from an earlier tutorial from the May 2021 ALCF Computational Performance Workshop, which used a Generative Adversial Network (GAN) for the test code: [CPW21: Profiling TensorFlow](https://github.com/argonne-lcf/CompPerfWorkshop-2021/tree/main/09_profiling_frameworks/TensorFlow).
A separate tutorial for profiling PyTorch codes (using a ResNet model) is also available from that workshop: [CPW21: Profiling PyTorch](https://github.com/argonne-lcf/CompPerfWorkshop-2021/tree/main/09_profiling_frameworks/PyTorchProfiler)


## A Starting Point

To download the MNIST dataset, make sure to enable HTTP forwarding:
```bash
export http_proxy=http://theta-proxy.tmi.alcf.anl.gov:3128
export https_proxy=https://theta-proxy.tmi.alcf.anl.gov:3128
```

Run the original script, single node, like so: `python train_MNIST.py`.  Feel free to ctrl+C once it hits a stable throughput.

Take note of the throughput reported!

```
2021-08-02 21:49:36,778 - INFO - (0, 292), Loss: 0.109, step_time: 0.271, throughput: 235.822 img/s.
2021-08-02 21:49:37,050 - INFO - (0, 293), Loss: 0.129, step_time: 0.271, throughput: 235.804 img/s.
2021-08-02 21:49:37,321 - INFO - (0, 294), Loss: 0.022, step_time: 0.271, throughput: 236.466 img/s.
2021-08-02 21:49:37,593 - INFO - (0, 295), Loss: 0.073, step_time: 0.272, throughput: 235.060 img/s.
2021-08-02 21:49:37,865 - INFO - (0, 296), Loss: 0.026, step_time: 0.271, throughput: 235.941 img/s.
2021-08-02 21:49:38,136 - INFO - (0, 297), Loss: 0.042, step_time: 0.271, throughput: 236.474 img/s.
2021-08-02 21:49:38,407 - INFO - (0, 298), Loss: 0.054, step_time: 0.271, throughput: 236.156 img/s.
2021-08-02 21:49:38,679 - INFO - (0, 299), Loss: 0.132, step_time: 0.272, throughput: 235.603 img/s.
2021-08-02 21:49:38,951 - INFO - (0, 300), Loss: 0.091, step_time: 0.271, throughput: 235.760 img/s.
2021-08-02 21:49:39,222 - INFO - (0, 301), Loss: 0.024, step_time: 0.271, throughput: 236.121 img/s.
2021-08-02 21:49:39,494 - INFO - (0, 302), Loss: 0.229, step_time: 0.271, throughput: 235.878 img/s.
```

On average, the A100 system is moving about 237 Images / second through this training loop.  Let's dig in to the first optimization in the [`line_profiler/`](./line_profiler/) subdirectory.

Below are the wrap up conclusions which you can read ahead or come back to later.

# Conclusions

Try the `optimized` version of the code - what throughput are you getting?  It should be a good deal faster! (~132000 Img/s - about 556x faster)  So, after all the profiling, what optimizations did we learn?

 - Make sure that IO isn't a bottleneck.  In this case, the fix for this bottleneck was simple.  With big datasets it can be a signficant challenge to keep the GPU fed and not idle on IO.
 - Make sure to use graph compilation where you can.  It's easy to make mistakes here: you must make sure to use only TensorFlow operations!
 - Use XLA.  It can give excellent speed ups by fusing operations.
 - Use reduced or mixed precision. Reduced precision becomes particularly powerful when XLA is involved, allowing you to keep the Tensor Cores chugging along with less memory-bound operations.

In general, if you have an application running in TensoFlow, it's a great idea to profile periodically and make sure you've got all the basic optimizations down!
