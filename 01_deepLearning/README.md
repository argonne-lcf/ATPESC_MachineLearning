Author: Bethany Lusch (blusch@anl.gov), adapting materials from Prasanna Balaprakash, Taylor Childers, Corey Adams, and Kyle Felker.

In this module, we introduce deep learning, which is a technique within machine learning. It tends to outperform other techniques when there is a large amount of data. 

This is a quick overview, but the goals are:
- You're intrigued by how machine learning could be used for your application area.
- You're ready this afternoon to learn about performance and scaling of deep learning.

Ready for more?
- Here are some of our longer training materials: https://github.com/argonne-lcf/sdl_ai_workshop
- Here's a thorough hands-on textbook: [book](https://www.oreilly.com/library/view/hands-on-machine-learning/9781492032632/) with [notebooks](https://github.com/ageron/handson-ml2).


This tutorial works through a supervised learning problem, specifically classification. 

Imagine you are making a machine for the post office that will automatically sort mail by zip code. The [MNIST dataset](http://yann.lecun.com/exdb/mnist/) contains thousands of examples of handwritten numbers, with each digit labeled 0-9. We will use deep learning to create a function that classifies each image of one number as a digit 0-9. 

![MNIST Task](images/mnist_task.png)

Outline:
- 01_introduction_mnist.ipynb: build up ideas of neural networks by hand
- 02_keras.ipynb: more complicated networks, using Python package
- 03_keras_cnn.ipynb: incorporate convolutional layers 
- Experiment with how to improve

Foundational rules of deep learning:
1. You must hold out some data ("test data") and not check the error there until the very end of your project! If you peek, you aren't really estimating how well you can generalize. (Note: tutorials break this rule.)
2. Neural networks generally can only interpolate in the input space, not extrapolate. 
