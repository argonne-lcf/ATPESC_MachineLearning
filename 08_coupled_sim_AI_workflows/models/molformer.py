"""MoLFormer-XL fine-tuning model (frozen encoder + linear regression head).

Exposes pure fit_head / predict_head primitives; the driver script wraps
these into Parsl/Dragon apps and decides how model state is passed between them.
"""
import os

import pandas as pd
import torch
import torch.nn as nn
from transformers import AutoTokenizer, AutoModel, AutoConfig


_MODEL_DIR = os.environ.get("MOLFORMER_WEIGHTS_DIR")
_tokenizer = None
_base_encoder = None
_encoder_hidden = None


def _get_device():
    if hasattr(torch, "xpu") and torch.xpu.is_available():
        return torch.device("xpu")
    elif hasattr(torch, "cuda") and torch.cuda.is_available():
        return torch.device("cuda")
    return torch.device("cpu")


def _get_tokenizer_and_encoder():
    """Load the MoLFormer tokenizer + encoder once per worker process.

    Returns cached instances on subsequent calls so we pay the load cost once
    per worker for the whole run instead of once per Parsl app invocation.
    """
    global _tokenizer, _base_encoder, _encoder_hidden
    if _tokenizer is None:
        if not _MODEL_DIR:
            raise RuntimeError(
                "MOLFORMER_WEIGHTS_DIR is not set; point it at the local "
                "MoLFormer snapshot directory."
            )
        _tokenizer = AutoTokenizer.from_pretrained(
            _MODEL_DIR, trust_remote_code=True, local_files_only=True,
        )
        _base_encoder = AutoModel.from_pretrained(
            _MODEL_DIR, deterministic_eval=True,
            trust_remote_code=True, local_files_only=True,
        )
        _encoder_hidden = AutoConfig.from_pretrained(
            _MODEL_DIR, trust_remote_code=True, local_files_only=True,
        ).hidden_size
    return _tokenizer, _base_encoder, _encoder_hidden


class MoLFormerRegressor(nn.Module):
    """MoLFormer encoder + linear head for scalar regression of IE scalars."""

    def __init__(self, encoder, hidden):
        super().__init__()
        # MoLFormer encoder (backbone)
        self.encoder = encoder
        # Linear regression head
        self.head = nn.Linear(hidden, 1)

    def forward(self, input_ids, attention_mask):
        out = self.encoder(input_ids=input_ids, attention_mask=attention_mask)
        return self.head(out.pooler_output).squeeze(-1)


def fit_head(train_data, seed = 42):
    """Fine-tune the linear head over MoLFormer embeddings on (SMILES, IE) pairs.

    Args:
        train_data: Dataframe with 'smiles' and 'ie' columns.
    Returns:
        Dict with CPU state_dict and target normalization stats.
    """
    torch.manual_seed(seed)
    tokenizer, base_encoder, hidden = _get_tokenizer_and_encoder()
    device = _get_device()

    model = MoLFormerRegressor(base_encoder, hidden).to(device)

    # Freeze the MoLFormer encoder since it already produces meaningful
    # embeddings for this dataset. Only train the linear regression head.
    for p in model.encoder.parameters():
        p.requires_grad = False

    smiles = list(train_data['smiles'])
    y = torch.tensor(train_data['ie'].to_numpy(), dtype=torch.float32)
    y_mean = float(y.mean())
    y_std = float(y.std().clamp_min(1e-6))
    y_norm = ((y - y_mean) / y_std).to(device)

    enc = tokenizer(
        smiles, padding='longest', truncation=True, max_length=256,
        return_tensors='pt',
    )
    input_ids = enc['input_ids'].to(device)
    attention_mask = enc['attention_mask'].to(device)

    optim = torch.optim.AdamW(model.head.parameters(), lr=5e-5)
    loss_fn = nn.MSELoss()

    epochs = 10
    batch_size = 16
    n = len(smiles)

    model.train()
    for _ in range(epochs):
        perm = torch.randperm(n, device=device)
        for start in range(0, n, batch_size):
            idx = perm[start:start + batch_size]
            optim.zero_grad()
            pred = model(input_ids[idx], attention_mask[idx])
            loss = loss_fn(pred, y_norm[idx])
            loss.backward()
            optim.step()

    return {
        "state_dict": {k: v.detach().cpu() for k, v in model.state_dict().items()},
        "y_mean": y_mean,
        "y_std": y_std,
    }


def predict_head(model_state, smiles):
    """Run a fine-tuned MoLFormer regressor over a list of SMILES.

    Args:
        model_state: Dict returned by fit_head.
        smiles: List of SMILES strings.
    Returns:
        Dataframe with 'smiles' and 'ie' columns.
    """
    tokenizer, base_encoder, hidden = _get_tokenizer_and_encoder()
    device = _get_device()

    model = MoLFormerRegressor(base_encoder, hidden)
    model.load_state_dict(model_state["state_dict"])
    model.to(device).eval()

    smiles = list(smiles)
    batch_size = 64
    preds = []
    with torch.no_grad():
        for start in range(0, len(smiles), batch_size):
            batch = smiles[start:start + batch_size]
            enc = tokenizer(
                batch, padding='longest', truncation=True, max_length=256,
                return_tensors='pt',
            )
            out = model(
                enc['input_ids'].to(device),
                enc['attention_mask'].to(device),
            )
            preds.append(out.detach().cpu())
    pred_y = torch.cat(preds).numpy() * model_state["y_std"] + model_state["y_mean"]
    return pd.DataFrame({'smiles': smiles, 'ie': pred_y})
