"""
utils/plots.py

Contains useful plotting functions.
"""
from __future__ import absolute_import, division, print_function, annotations
from typing import Any, Optional
import logging

import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

log = logging.getLogger(__name__)

COLORS = {
    'blue':     '#2196f3',
    'red':      '#f44336',
    'green':    '#63ff5b',
    'orange':   '#FD971F',
    'purple':   '#AE81FF',
    'yellow':   '#ffeb3b',
    'grey':     '#666666',
    'teal':     '#00CC99',
    'pink':     '#E91E63',
}


def set_plot_style(**kwargs) -> None:
    # plt.rcParams['figure.figsize'] = [
    #     i / 2. for i in plt.rcParamsDefault['figure.figsize']
    # ]

    plt.style.use('default')
    plt.rcParams.update({
        'image.cmap': 'viridis',
        'savefig.transparent': True,
        'text.color': '#666666',
        'xtick.color': '#66666604',
        'ytick.color': '#66666604',
        'ytick.labelcolor': '#666666',
        'xtick.labelcolor': '#666666',
        'axes.edgecolor': '#66666600',
        'axes.labelcolor': '#666666',
        # 'axes.labelcolor': (189, 189, 189, 1.0),
        'grid.color': (0.434, 0.434, 0.434, 0.2),  # #66666602
        'axes.facecolor': (1.0, 1.0, 1.0, 0.0),
        'figure.facecolor': (1.0, 1.0, 1.0, 0.0),
    })
    from matplotlib.pyplot import cycler
    plt.rcParams['axes.prop_cycle'] = cycler(
        'color',
        list(COLORS.values())
    )
    plt.rcParams['axes.labelcolor'] = '#bdbdbd'
    plt.rcParams.update(**kwargs)


def scatter(
        x: np.ndarray,
        y: np.ndarray,
        figsize: tuple[int, int] = (4, 4),
        fig: Optional[plt.Figure] = None,
        ax: Optional[plt.Axes] = None,
        cmap: Optional[str] = 'rainbow',
        xlabel: Optional[str] = None,
        ylabel: Optional[str] = None,
        title: Optional[str] = None,
        plot_kwargs: Optional[dict[str, Any]] = None,
) -> tuple[plt.Figure, plt.Axes]:
    if fig is None and ax is None:
        fig, ax = plt.subplots(figsize=figsize, tight_layout=True)
    if fig is None:
        fig = plt.gcf()
    if ax is None:
        ax = plt.gca()

    assert isinstance(ax, plt.Axes)
    assert isinstance(fig, plt.Figure)
    pkwargs = {'edgecolor': 'k', 'alpha': 0.33}
    plot_kwargs = pkwargs if plot_kwargs is None else plot_kwargs

    _ = ax.scatter(
        x[:, 0],
        x[:, 1],
        # edgecolor='#222',
        # alpha=0.33,
        c=y,
        cmap=cmap,
        **plot_kwargs,
    )
    if xlabel is not None:
        _ = ax.set_xlabel(xlabel)
    if ylabel is not None:
        _ = ax.set_ylabel(ylabel)
    if title is not None:
        _ = ax.set_title(title)

    _ = ax.grid(True, alpha=0.1)

    assert fig is not None and ax is not None

    return fig, ax


def plot_kmeans_obj(
        x: np.ndarray,
        nclusters: int = 10,
        plot_points: Optional[bool] = True,
) -> np.ndarray:
    opt_obj_vec = []
    nclusters = 10 if nclusters is None else nclusters
    # set_plot_style()
    for k in range(1, nclusters):
        model = KMeans(n_clusters=k)
        model.fit(x)
        assert model.inertia_ is not None
        opt_obj_vec.append(model.inertia_ / x.shape[0])
        if plot_points:
            plot_kmeans_points(
                x=x,
                centers=model.cluster_centers_,
                labels=model.labels_
            )

    k = np.arange(len(opt_obj_vec)) + 1
    _, ax = plt.subplots(tight_layout=True)
    _ = ax.plot(k, opt_obj_vec, '--o')
    _ = ax.set_xlabel('Number of clusters (k)')
    _ = ax.set_ylabel('Inertia')
    _ = ax.grid(True, alpha=0.1)

    return np.array(opt_obj_vec)


def plot_kmeans_points(
        x: np.ndarray,
        centers: np.ndarray,
        labels: Optional[np.ndarray] = None,
        title: Optional[str] = None,
        cmap: Optional[str | Any] = None,
) -> tuple[plt.Figure, plt.Axes]:
    # set_plot_style()
    cmap = 'rainbow' if cmap is None else cmap
    fig, ax = plt.subplots(
        tight_layout=True,
        # figsize=(4, 4),
        subplot_kw={'aspect': 'equal'},
    )
    _ = ax.scatter(
        x[:, 0],
        x[:, 1],
        c=labels,
        alpha=0.4,
        edgecolor=None,
        cmap=cmap,
    )
    _ = ax.scatter(
        centers[:, 0],
        centers[:, 1],
        marker='*',
        s=100,
    )
    _ = ax.set_xlabel('x0')
    _ = ax.set_ylabel('x1')
    _ = plt.grid(True, alpha=0.2)
    if title is not None:
        _ = ax.set_title(title)
    _ = plt.show()

    return fig, ax


def plot_hists(
        kmeans_bins: list | np.ndarray,
        ybins: list | np.ndarray,
        xlabels: Optional[list | np.ndarray] = None
):
    """Specific function to plot histograms from bins."""
    xlabels = ['Malignant', 'Benign'] if xlabels is None else xlabels
    x = np.arange(len(xlabels))
    width = 0.35
    fig, ax = plt.subplots()
    rects1 = ax.bar(x - width / 2.0, ybins, width, label='True label')
    rects2 = ax.bar(x + width / 2.0, kmeans_bins, width, label='K-Means')
    _ = ax.set_ylabel('Total Count')
    _ = ax.set_title('Histogram')
    _ = ax.set_xticks(x)
    ax.set_xticklabels(xlabels)
    ax.set_ylim(0, 450)

    def autolabel(rects):
        """Add label above each bar in `rects`, displaying its height."""
        for rect in rects:
            height = rect.get_height()
            _ = ax.annotate(
                f'{height}',
                xy=(rect.get_x() + rect.get_width() / 2., height),
                xytext=(0, 3),  # 3 points with vertical offset
                textcoords='offset points',
                ha='center',
                va='bottom'
            )

    _ = ax.legend(loc='upper left', framealpha=0.2, labelcolor='#9E9E9E')
    autolabel(rects1)
    autolabel(rects2)
    fig.tight_layout()
    plt.show()


def plot_pca(
        x: np.ndarray,
        components: list[int] = [1, 2],
        figsize: tuple[float, float] = (8., 6.),
        color_vector: Optional[list | np.ndarray] = None,
        scale: bool = False,
        title: Optional[str] = None
) -> tuple[plt.Figure, plt.Axes]:
    """
    Apply PCA to input x.
    Args:
        color_vector : each element corresponds to a row in x.
            Unique elements are colored with a different color.

    Returns:
        pca : object of sklearn.decomposition.PCA()
        x_pca : pca matrix
        fig : PCA plot figure handle
    """
    import matplotlib.pyplot as plt
    from matplotlib import cm
    import pandas as pd
    if color_vector is not None:
        assert len(x) == len(color_vector), (
            'len(df) and len(color_vector) must be the same size.'
        )
        n_colors = len(np.unique(color_vector))
        cmap = plt.get_cmap('rainbow')
        colors = iter(cmap(np.linspace(0, 1, n_colors)))
    else:
        colors = plt.get_cmap('viridis')

    assert x is not None
    df = pd.DataFrame(x)
    from sklearn.decomposition import PCA
    from sklearn.preprocessing import StandardScaler

    # PCA
    if scale:
        df = StandardScaler().fit_transform(df.values)
    else:
        df = df.values

    n_components = max(components)
    pca = PCA(n_components=n_components)
    x_pca = pca.fit_transform(df)
    pc0 = components[0] - 1
    pc1 = components[1] - 1

    # Start plotting
    fig, ax = plt.subplots(figsize=figsize)
    alpha = 0.7

    if color_vector is not None:
        for color in np.unique(color_vector):
            idx = color_vector == color
            c = next(colors)
            ax.scatter(x_pca[idx, pc0], x_pca[idx, pc1], alpha=alpha,
                       marker='o', edgecolor=c, color=c,
                       label=f'{color}')
    else:
        ax.scatter(x_pca[:, pc0], x_pca[:, pc1], alpha=alpha,
                   marker='s', edgecolors=None, color='b')

    ax.set_xlabel('PC' + str(components[0]))
    ax.set_ylabel('PC' + str(components[1]))
    ax.legend(loc='lower left', bbox_to_anchor=(1.01, 0.0), ncol=1, borderaxespad=0, frameon=True)
    plt.grid(True)
    if title:
        ax.set_title(title)

    print('Explained variance by PCA components [{}, {}]: [{:.5f}, {:.5f}]'.format(
        components[0], components[1],
        pca.explained_variance_ratio_[pc0],
        pca.explained_variance_ratio_[pc1]))

    return pca, x_pca
