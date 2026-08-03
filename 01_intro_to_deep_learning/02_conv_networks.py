#!/usr/bin/env python
"""MNIST handwritten digits classification with CNNs -- batch/PBS version of
02_conv_networks.ipynb

Author: Huihuo Zheng (huihuo.zheng@anl.gov), adapting codes from Bethany Lusch,
Varuni Sastry, Prasanna Balprakash, Corey Adams, and Kyle Felker

Same content as the interactive notebook
(../../ATPESC_MachineLearning/01_intro_to_deep_learning/02_conv_networks.ipynb),
adapted to run non-interactively on a Polaris compute node via PBS: matplotlib
uses the "Agg" backend and saves figures to $OUTDIR, and the model/batches are
moved to CUDA when available. The notebook's markdown-only "Advanced networks"
section (ResNet/U-Nets/ViTs) has no executable content and is omitted here --
see the notebook or the slide deck for that discussion.
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


class MNISTClassifier(nn.Module):
    def __init__(self):
        super().__init__()
        self.conv_1 = nn.Conv2d(in_channels=1, out_channels=32, kernel_size=3)
        self.conv_2 = nn.Conv2d(in_channels=32, out_channels=64, kernel_size=3)
        self.drop_3 = nn.Dropout(p=0.25)
        self.dense_4 = nn.Linear(in_features=9216, out_features=128)
        self.drop_5 = nn.Dropout(p=0.5)
        self.dense_6 = nn.Linear(in_features=128, out_features=10)

    def forward(self, inputs):
        x = self.conv_1(inputs)
        x = nn.functional.relu(x)
        x = self.conv_2(x)
        x = nn.functional.relu(x)
        x = nn.functional.max_pool2d(x, kernel_size=2)
        x = self.drop_3(x)
        x = torch.flatten(x, start_dim=1)
        x = self.dense_4(x)
        x = nn.functional.relu(x)
        x = self.drop_5(x)
        x = self.dense_6(x)
        x = nn.functional.softmax(x, dim=1)
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


def train_network(batch_size, epochs, lr):
    cnn_model = MNISTClassifier().to(device)
    train_dataloader = torch.utils.data.DataLoader(training_data, batch_size=batch_size)
    val_dataloader = torch.utils.data.DataLoader(validation_data, batch_size=batch_size)
    optimizer = torch.optim.Adam(cnn_model.parameters(), lr=lr)
    loss_fn = nn.CrossEntropyLoss()

    history = numpy.zeros((epochs, 4))
    for j in range(epochs):
        train_one_epoch(train_dataloader, cnn_model, loss_fn, optimizer)
        acc_train, loss_train = evaluate(train_dataloader, cnn_model, loss_fn)
        acc_val, loss_val = evaluate(val_dataloader, cnn_model, loss_fn)
        print(f"Epoch {j}: val. loss: {loss_val:.4f}, val. accuracy: {acc_val:.4f}")
        history[j, :] = [acc_train, loss_train, acc_val, loss_val]

    return history, cnn_model


batch_size = 512
epochs = 3
lr = 0.01
t0 = time.time()
history, cnn_model = train_network(batch_size, epochs, lr)
print(f"[CNN] training wall time: {time.time() - t0:.1f}s")

plt.figure(figsize=(5, 3))
plt.plot(range(epochs), history[:, 1], label="training loss")
plt.plot(range(epochs), history[:, 3], label="val. loss")
plt.title("loss")
plt.xlabel("epochs")
plt.ylabel("loss")
plt.legend()
plt.savefig(os.path.join(OUTDIR, "02_cnn_loss.png"), bbox_inches="tight")
plt.close()

plt.figure(figsize=(5, 3))
plt.plot(range(epochs), history[:, 0], label="training accuracy")
plt.plot(range(epochs), history[:, 2], label="val. accuracy")
plt.title("accuracy")
plt.xlabel("epochs")
plt.ylabel("accuracy")
plt.legend()
plt.savefig(os.path.join(OUTDIR, "02_cnn_accuracy.png"), bbox_inches="tight")
plt.close()

print("Done. Figures written to", OUTDIR)
