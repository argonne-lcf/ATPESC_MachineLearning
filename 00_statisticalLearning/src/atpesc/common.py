"""
common.py

Contains helper functions.
"""
from __future__ import absolute_import, division, print_function, annotations
from typing import Any, Optional
import logging

import numpy as np
from sklearn import datasets
from pathlib import Path
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans

from atpesc.utils.plots import plot_kmeans_obj

SEED = 1234
DEFAULT_LR = float(1e-6)

HERE = Path(__file__).parent
SECTION_DIR = HERE.parent.parent
DATA_DIR = HERE.parent.parent.joinpath('data')

Array = np.ndarray


log = logging.getLogger(__name__)


def predict_price(slope: Any, input_area: Any):
    return slope * input_area


def evaluate(slope, input_area, true_price) -> np.floating:
    price_prediction = predict_price(slope, input_area)
    return np.mean((true_price - price_prediction) ** 2)


def learn(
        input_area: float,
        input_price: float,
        input_slope: float,
        learning_rate: Optional[float] = None
) -> np.floating:
    learning_rate = DEFAULT_LR if learning_rate is None else learning_rate
    # ------------------------------------
    # 1. First compute: df/dx, where:
    #   f = predict_price
    #   x = input_size
    # ------------------------------------
    tmp = (2. * input_area) * (
        predict_price(input_slope, input_area) - input_price
    )
    dfdx = np.mean(tmp)
    # --------------------------------------------
    # 2. Update the slope via SGD Update step
    # --------------------------------------------
    return input_slope - learning_rate * dfdx


def load_cancer_data() -> tuple[Array, Array]:
    """Returns cancer dataset (unscaled)."""
    from sklearn import datasets
    import pandas as pd
    data = datasets.load_breast_cancer()
    assert isinstance(data, dict)
    x = pd.DataFrame(
        data['data'],
        columns=data['feature_names']
    )
    x = x[sorted(x.columns)]
    y = data['target']

    return x, y


def create_run_blob_kmeans(
        nsamples: int,
        nfeatures: int,
        nclusters: int
) -> None:
    x, _ = datasets.make_blobs(
        n_samples=nsamples,
        n_features=nfeatures,
        centers=nclusters,
        random_state=SEED
    )

    # Normalize features
    x_ = StandardScaler().fit_transform(x)
    model = KMeans(
        n_clusters=nclusters,
        init='k-means++',
        n_init=10,
        max_iter=300,
        random_state=SEED,
        # n_jobs=4,
    )
    model.fit(x_)
    plot_kmeans_obj(x_, 20)
