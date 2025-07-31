import dragon
import numpy as np
import torch
import torch.nn.functional as F
import torch.nn as nn

# basis functions
from scipy.special import eval_chebyt as cheby
from scipy.special import eval_legendre as legendre
from scipy.special import eval_hermite as hermite

from dragon.data.ddict import DDict


def poly(n: int, x: float) -> float:
    """polynomial basis functions

    :param n: polynomial degree
    :type n: int
    :param x: input value
    :type x: float
    :return: x^n
    :rtype: float
    """
    return x**n


BASIS_DEGREE = 6


def make_features(x: float, basis: callable = poly) -> torch.tensor:
    """builds features for a given set of basis functions

    :param x: input values
    :type x: float
    :param basis: basis for interpolation, defaults to poly
    :type basis: callable, optional
    :return: basis functions evaluated at x
    :rtype: torch.tensor
    """
    x = np.expand_dims(x, axis=1)
    features = []
    for i in range(0, BASIS_DEGREE):
        output = torch.tensor(basis(i, x))
        features.append(output)
    torch_features = torch.cat(features, 1).to(dtype=torch.float32)
    return torch_features


def f(x: float) -> float:
    """Approximated function.

    :param x: value to compute at
    :type x: float
    :return: sin(x)
    :rtype: float
    """
    return torch.sin(x)


class Net(nn.Module):
    """Single fully connected layer"""

    def __init__(self):
        super(Net, self).__init__()
        self.fc = torch.nn.Linear(BASIS_DEGREE, 1)

    def forward(self, x: torch.tensor) -> float:
        output = self.fc(x)
        return output


def infer(dd: DDict, model: torch.nn, device: str):
    """does inference for the model and input data put into the q_in and returns results in the q_out

    :param dd: Distributed Dictionary
    :type q_in: DDict
    :param model: ML model to perform inference with
    :type model: torch.nn
    :param device: device on which to run
    :type device: string
    """
    # Get data
    data = dd['x']
    data = make_features(data)
    data = data.to(device)

    # Forward pass
    model.to(device)
    model.eval()
    with torch.no_grad():
        output = model(data)

    output = torch.squeeze(output).cpu()
    dd['prediction'] = output


def train(dd: DDict, model: torch.nn, optimizer: torch.optim, device: str) -> float:
    """trains the model on generated data

    :param dd: Distributed Dictionary
    :type q_in: DDict
    :param model: model to train
    :type model: torch.nn
    :param optimizer: optimizer to use for training
    :type optimizer: torch.optim
    :param device: device on which to run
    :type device: string
    :return: training computed loss
    :rtype: float
    """
    # Get data
    inputs = dd['train_inputs']
    inputs = make_features(inputs)
    targets = torch.tensor(dd['train_outputs'])
    targets = targets.unsqueeze(1)

    # get data into dataloader format
    dataset = torch.utils.data.TensorDataset(inputs, targets)
    dataloader = torch.utils.data.DataLoader(dataset, batch_size=32, shuffle=True)

    # Train
    model.to(device)
    model.train()
    total_loss = 0.
    num_batches = len(dataloader)
    for batch_idx, batch in enumerate(dataloader):
        x, y = batch
        x = x.to(device)
        y = y.to(device)
       
        # Reset gradients
        optimizer.zero_grad()

        # Forward pass
        output = model(x)
        loss = F.smooth_l1_loss(output, y)

        # Backward pass
        loss.backward()

        # Apply gradients
        optimizer.step()

        print(f'Batch = {batch_idx}, loss = {loss.item()}',flush=True)
        total_loss += loss.item()

    return total_loss / num_batches
