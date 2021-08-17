import sys
import time
import argparse
import logging
from logging import handlers

import tensorflow as tf
import numpy

import horovod.tensorflow as hvd


# Read in the mnist data so we have it loaded globally:
(x_train, y_train), (x_test, y_test) = tf.keras.datasets.mnist.load_data()
x_train = x_train.astype(numpy.float32)
x_test  = x_test.astype(numpy.float32)

x_train /= 255.
x_test  /= 255.

y_train = y_train.astype(numpy.int32)
y_test  = y_test.astype(numpy.int32)

dataset = tf.data.Dataset.from_tensor_slices((x_train, y_train))
dataset.shuffle(60000)


def init_mpi():
    # Using the presence of an env variable to determine if we're using MPI:
    try:
        hvd.init()
        return hvd.rank(), hvd.size()
    except:
        if "mpirun" in sys.argv or "mpiexec" in sys.argv:
            raise Exception("MPI detected in command line but was not able to init!")
        return 0, 1


def configure_logger(rank):
    '''Configure a global logger

    Adds a stream handler and a file hander, buffers to file (10 lines) but not to stdout.

    Submit the MPI Rank

    '''
    logger = logging.getLogger()

    # Create a handler for STDOUT, but only on the root rank.
    # If not distributed, we still get 0 passed in here.
    if rank == 0:
        stream_handler = logging.StreamHandler()
        formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
        stream_handler.setFormatter(formatter)
        handler = handlers.MemoryHandler(capacity=0, target=stream_handler)
        logger.addHandler(handler)

        # Add a file handler too:
        log_file = "process.log"
        file_handler = logging.FileHandler(log_file)
        file_handler.setFormatter(formatter)
        file_handler = handlers.MemoryHandler(capacity=10, target=file_handler)
        logger.addHandler(file_handler)

        logger.setLevel(logging.INFO)
    else:
        # in this case, MPI is available but it's not rank 0
        # create a null handler
        handler = logging.NullHandler()
        logger.addHandler(handler)
        logger.setLevel(logging.INFO)


class MNISTClassifier(tf.keras.models.Model):

    def __init__(self, activation=tf.nn.tanh):
        tf.keras.models.Model.__init__(self)

        self.conv_1 = tf.keras.layers.Conv2D(32, [3, 3], activation='relu')
        self.conv_2 = tf.keras.layers.Conv2D(64, [3, 3], activation='relu')
        self.pool_3 = tf.keras.layers.MaxPooling2D(pool_size=(2, 2))
        self.drop_4 = tf.keras.layers.Dropout(0.25)
        self.dense_5 = tf.keras.layers.Dense(128, activation='relu')
        self.drop_6 = tf.keras.layers.Dropout(0.5)
        self.dense_7 = tf.keras.layers.Dense(10, activation='softmax')

    @tf.function(jit_compile=True)
    def call(self, inputs):
        '''
        Reshape at input and output:
        '''
        # batch_size = inputs.shape[0]

        x = self.conv_1(inputs)
        x = self.conv_2(x)
        x = self.pool_3(x)
        x = self.drop_4(x)
        x = tf.keras.layers.Flatten()(x)
        x = self.dense_5(x)
        x = self.drop_6(x)
        x = self.dense_7(x)

        return x


#@tf.function(jit_compile=True)
def compute_loss(y_true, y_pred):
    # if labels are integers, use sparse categorical crossentropy
    # network's final layer is softmax, so from_logtis=False
    scce = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=False)
    # if labels are one-hot encoded, use standard crossentropy

    return scce(y_true, y_pred)  # .numpy()


@tf.function(jit_compile=True)
def forward_pass(model, batch_data, y_true):
    y_pred = model(batch_data)
    loss = compute_loss(y_true, y_pred)
    return loss


def train_loop(batch_size, n_training_epochs, model, opt, global_size):

    @tf.function(jit_compile=True)
    def train_iteration(data, y_true, model, opt, global_size):
        with tf.GradientTape() as tape:
            loss = forward_pass(model, data, y_true)

        if global_size != 1:
            tape = hvd.DistributedGradientTape(tape)

        trainable_vars = model.trainable_variables

        # Apply the update to the network (one at a time):
        grads = tape.gradient(loss, trainable_vars)

        opt.apply_gradients(zip(grads, trainable_vars))
        return loss


    logger = logging.getLogger()

    rank = hvd.rank()
    for i_epoch in range(n_training_epochs):

        epoch_steps = int(60000/batch_size)
        dataset.shuffle(60000) # Shuffle the whole dataset in memory
        batches = dataset.batch(batch_size=batch_size, drop_remainder=True)

        for i_batch, (batch_data, y_true) in enumerate(batches):

            batch_data = tf.reshape(batch_data, [-1, 28, 28, 1])

            start = time.time()

            loss = train_iteration(batch_data, y_true, model, opt, global_size)

            end = time.time()

            images = batch_size*global_size

            logger.info(f"({i_epoch}, {i_batch}), Loss: {loss:.3f}, step_time: {end-start :.3f}, throughput: {images/(end-start):.3f} img/s.")


def train_network(_batch_size, _training_iterations, _lr, global_size):

    mnist_model = MNISTClassifier()

    opt = tf.keras.optimizers.Adam(_lr)

    if global_size != 1:
        hvd.broadcast_variables(mnist_model.variables, root_rank=0)
        hvd.broadcast_variables(opt.variables(), root_rank=0)

    train_loop(_batch_size, _training_iterations, mnist_model, opt, global_size)


if __name__ == '__main__':

    rank, size = init_mpi()
    configure_logger(rank)

    parser = argparse.ArgumentParser(description='TensorFlow MNIST Example')
    parser.add_argument('--batch_size', type=int, default=64, metavar='N',
                        help='input batch size for training (default: 64)')
    parser.add_argument('--epochs', type=int, default=10, metavar='N',
                        help='number of epochs to train (default: 10)')
    parser.add_argument('--lr', type=float, default=0.01, metavar='LR',
                        help='learning rate (default: 0.01)')
    # parser.add_argument('--device', default='cpu',
    #                     help='Wheter this is running on cpu or gpu')
    # parser.add_argument('--num_inter', default=2, help='set number inter', type=int)
    # parser.add_argument('--num_intra', default=0, help='set number intra', type=int)
    # parser.add_argument('--warmup_epochs', default=3, help='number of warmup epochs',
    # type=int)

    args = parser.parse_args()
    scaled_lr = args.lr * hvd.size()
    train_network(args.batch_size, args.epochs, scaled_lr, size)
