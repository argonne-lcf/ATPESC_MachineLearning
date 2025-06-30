# Introduction to deep learning
ATPESC 2024

Author: Bethany Lusch (blusch@anl.gov), adapting materials from Marieme Ngom, Prasanna Balaprakash, Taylor Childers, Corey Adams, and Kyle Felker.

This is a hands-on introduction to deep learning, a machine learning technique that tends to outperform other techniques when dealing with a large amount of data. 

This is a quick overview, but the goals are:
- to introduce the fundamental concepts of deep learning through hands-on activities
- to give you the necessary background for the more advanced topics on scaling and performance that we will teach later today.

Some rough definitions:

- Artificial intelligence (AI) is a set of approaches to solving complex problems by imitating the brain's ability to learn.
- Machine learning (ML) is the field of study that gives computers the ability to learn without being explicitly programmed (i.e. learning patterns instead of writing down rules.) Arguably, machine learning is now a subfield of AI.


Ready for more?
- Here are some of our longer training materials: https://www.alcf.anl.gov/alcf-ai-science-training-series
- Here's a thorough hands-on textbook: [book](https://www.oreilly.com/library/view/hands-on-machine-learning/9781492032632/) with [notebooks](https://github.com/ageron/handson-ml2).

We will work on a classification problem involving the [MNIST dataset](http://yann.lecun.com/exdb/mnist/) that contains thousands of examples of handwritten numbers, with each digit labeled 0-9. The model is learning to "classify" images as one of ten classes.
![MNIST Task](images/mnist_task.png)

We are going to run Jupyter notebooks. You can run them in Google Colab (see instructions [here](../README.md)). If that's a problem you can also use your own computer or ALCF's [JupyterHub](https://docs.alcf.anl.gov/services/jupyter-hub/).



