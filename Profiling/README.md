# README

Examples to profile DL codes on CPU and GPU 
  
The sample code used in this exercise is keras_mnist.py - Keras with Tensorflow backend

To run on Theta:
``` qsub -A ATPSEC2020 -q ATPSEC2020 -t 1:00:00 -n 1 qsub_mnist_profile_cpu.sh ```

Cooley:
``` qsub -A training -q training -t 1:00:00 -n 1 qsub_mnist_profile_cpu.sh ```


To view the profiling results in GUI, follow the commands in the section "Steps to visualize results" in each script.
