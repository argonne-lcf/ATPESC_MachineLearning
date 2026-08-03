#!/usr/bin/env python
"""Introduction to Deep Learning -- batch/PBS version of 01_introduction_mnist.ipynb

Author: Huihuo Zheng (huihuo.zheng@anl.gov), adapting materials from Bethany Lusch,
Marieme Ngom, Asad Khan, Prasanna Balaprakash, Taylor Childers, Corey Adams,
Kyle Felker, and Tanwi Mallick.

Same content as the interactive notebook
(../../ATPESC_MachineLearning/01_intro_to_deep_learning/01_introduction_mnist.ipynb),
adapted to run non-interactively on a Polaris compute node via PBS:
  - matplotlib uses the non-interactive "Agg" backend; every figure is saved to
    $OUTDIR instead of displayed inline.
  - Tensors/models are moved to CUDA when available.
  - The notebook's final open exercise (train + evaluate NonlinearClassifier) is
    filled in here so the script runs end-to-end unattended.
"""
import os
import time

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

import numpy
import torch
import torchvision
from torch import nn

OUTDIR = os.environ.get("OUTDIR", "outputs")
os.makedirs(OUTDIR, exist_ok=True)

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print(f"Using device: {device}")

# ---------------------------------------------------------------- MNIST dataset
training_data = torchvision.datasets.MNIST(
    root="data", train=True, download=True,
    transform=torchvision.transforms.ToTensor(),
)
test_data = torchvision.datasets.MNIST(
    root="data", train=False, download=True,
    transform=torchvision.transforms.ToTensor(),
)
training_data, validation_data = torch.utils.data.random_split(
    training_data, [0.8, 0.2], generator=torch.Generator().manual_seed(55)
)
print("MNIST data loaded: train:", len(training_data), " examples, validation: ",
      len(validation_data), "examples, test:", len(test_data), "examples")
print("Input shape", training_data[0][0].shape)

plt.figure(figsize=(10, 1))
for i in range(10):
    plt.subplot(1, 10, i + 1)
    plt.axis("off")
    plt.imshow(numpy.reshape(training_data[i][0], (28, 28)), cmap="gray")
    plt.title("Class: " + str(training_data[i][1]))
plt.savefig(os.path.join(OUTDIR, "01_mnist_samples.png"), bbox_inches="tight")
plt.close()

batch_size = 128
train_dataloader = torch.utils.data.DataLoader(training_data, batch_size=batch_size)
val_dataloader = torch.utils.data.DataLoader(validation_data, batch_size=batch_size)


# ---------------------------------------------------------------- Linear model
class LinearClassifier(nn.Module):
    def __init__(self):
        super().__init__()
        self.flatten = nn.Flatten()
        self.layer_1 = nn.Linear(28 * 28, 10)

    def forward(self, x):
        x = self.flatten(x)
        x = self.layer_1(x)
        return x


def train_one_epoch(dataloader, model, loss_fn, optimizer):
    model.train()
    for X, y in dataloader:
        X, y = X.to(device), y.to(device)
        pred = model(X)
        loss = loss_fn(pred, y)
        loss.backward()
        optimizer.step()
        optimizer.zero_grad()


def evaluate(dataloader, model, loss_fn):
    model.eval()
    size = len(dataloader.dataset)
    num_batches = len(dataloader)
    loss, correct = 0, 0
    with torch.no_grad():
        for X, y in dataloader:
            X, y = X.to(device), y.to(device)
            pred = model(X)
            loss += loss_fn(pred, y).item()
            correct += (pred.argmax(1) == y).type(torch.float).sum().item()
    loss /= num_batches
    correct /= size
    return 100 * correct, loss


linear_model = LinearClassifier().to(device)
print(linear_model)
loss_fn = nn.CrossEntropyLoss()
optimizer = torch.optim.SGD(linear_model.parameters(), lr=0.01)

epochs = 5
t0 = time.time()
for j in range(epochs):
    train_one_epoch(train_dataloader, linear_model, loss_fn, optimizer)
    acc, loss = evaluate(train_dataloader, linear_model, loss_fn)
    print(f"Epoch {j}: training loss: {loss}, accuracy: {acc}")
print(f"[linear model] training wall time: {time.time() - t0:.1f}s")

acc_val, loss_val = evaluate(val_dataloader, linear_model, loss_fn)
print("Validation loss: %.4f, validation accuracy: %.2f%%" % (loss_val, acc_val))


def show_failures(model, dataloader, tag, maxtoshow=10):
    model.eval()
    batch = next(iter(dataloader))
    X, y = batch[0].to(device), batch[1].to(device)
    predictions = model(X)
    rounded = predictions.argmax(1)
    errors = rounded != y
    print(f"[{tag}] showing max", maxtoshow, "first failures. "
          "The predicted class is shown first and the correct class in parentheses.")
    ii = 0
    plt.figure(figsize=(maxtoshow, 1))
    for i in range(X.shape[0]):
        if ii >= maxtoshow:
            break
        if errors[i]:
            plt.subplot(1, maxtoshow, ii + 1)
            plt.axis("off")
            plt.imshow(X[i, 0, :, :].cpu(), cmap="gray")
            plt.title("%d (%d)" % (rounded[i], y[i]))
            ii += 1
    plt.savefig(os.path.join(OUTDIR, f"01_{tag}_failures.png"), bbox_inches="tight")
    plt.close()


show_failures(linear_model, val_dataloader, "linear")


# ---------------------------------------------------------------- Nonlinear model
class NonlinearClassifier(nn.Module):
    def __init__(self):
        super().__init__()
        self.flatten = nn.Flatten()
        self.layers_stack = nn.Sequential(
            nn.Linear(28 * 28, 50),
            nn.ReLU(),
            nn.Linear(50, 50),
            nn.ReLU(),
            nn.Linear(50, 10),
        )

    def forward(self, x):
        x = self.flatten(x)
        x = self.layers_stack(x)
        return x


# Completed exercise: compile, fit, and predict using NonlinearClassifier()
# (the notebook leaves this as a live exercise for the interactive session).
# The nonlinear model's loss surface is non-convex (unlike the linear model's
# convex softmax regression), so plain SGD starts much slower -- it needs more
# epochs than the linear model to converge and show its higher-capacity edge.
nonlinear_model = NonlinearClassifier().to(device)
print(nonlinear_model)
optimizer = torch.optim.SGD(nonlinear_model.parameters(), lr=0.01)

nonlinear_epochs = 20
t0 = time.time()
for j in range(nonlinear_epochs):
    train_one_epoch(train_dataloader, nonlinear_model, loss_fn, optimizer)
    acc, loss = evaluate(train_dataloader, nonlinear_model, loss_fn)
    print(f"Epoch {j}: training loss: {loss}, accuracy: {acc}")
print(f"[nonlinear model] training wall time: {time.time() - t0:.1f}s")

acc_val, loss_val = evaluate(val_dataloader, nonlinear_model, loss_fn)
print("Validation loss: %.4f, validation accuracy: %.2f%%" % (loss_val, acc_val))
show_failures(nonlinear_model, val_dataloader, "nonlinear")

print("Done. Figures written to", OUTDIR)
