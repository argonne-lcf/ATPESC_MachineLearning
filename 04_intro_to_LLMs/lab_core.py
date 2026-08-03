"""Local, deterministic teaching utilities for the ATPESC LLM micro-lab.

The notebook keeps setup mechanics in this module so its visible cells can focus
on tokenization, shifted targets, causal loss, and generation.
"""

from __future__ import annotations

import math
import random
import time
import unicodedata
from collections.abc import Sequence
from contextlib import suppress
from dataclasses import dataclass
from pathlib import Path
from typing import Literal, Protocol, cast

import torch
from torch import Tensor, nn
from torch.nn import functional as F

SEED = 2026
SPECIAL_TOKENS = ("<PAD>", "<BOS>", "<EOS>", "<UNK>")
Normalization = Literal["NFC", "NFD", "NFKC", "NFKD"]
DEMO_TEXTS = (
    "MPI_Comm_rank returns 0.",
    " Aurora trains LLMs.",
    "é",
    "e\u0301",
    "MPI_Comm_rank(comm, &rank); // ε = 1.0e−12",
)
DEMO_SUBWORDS = (
    "MPI_Comm_rank",
    " returns",
    " 0",
    "Aurora",
    " trains",
    " LLMs",
    "comm",
    "rank",
    " //",
    " ε",
    " =",
    " 1.0e−12",
)


@dataclass(frozen=True)
class Encoding:
    """One transparent tokenizer result."""

    tokenizer_name: str
    original_text: str
    normalized_text: str
    tokens: tuple[str, ...]
    ids: tuple[int, ...]

    @property
    def count(self) -> int:
        return len(self.ids)


class TeachingTokenizer(Protocol):
    """Small interface shared by the three transparent tokenizers."""

    name: str

    @property
    def vocab_size(self) -> int: ...

    def encode(self, text: str, *, add_special_tokens: bool = False) -> Encoding: ...

    def decode(self, ids: Sequence[int]) -> str: ...


def _normalize(text: str, normalization: Normalization | None) -> str:
    return unicodedata.normalize(normalization, text) if normalization else text


class CodePointTokenizer:
    """Map each Unicode code point to one deterministic vocabulary ID."""

    def __init__(
        self,
        vocabulary_texts: Sequence[str],
        *,
        normalization: Normalization | None,
        name: str,
    ) -> None:
        self.name = name
        self.normalization = normalization
        normalized = (_normalize(text, normalization) for text in vocabulary_texts)
        alphabet = tuple(sorted(set("".join(normalized))))
        self.id_to_token = SPECIAL_TOKENS + alphabet
        self.token_to_id = {token: idx for idx, token in enumerate(self.id_to_token)}

    @property
    def vocab_size(self) -> int:
        return len(self.id_to_token)

    def encode(self, text: str, *, add_special_tokens: bool = False) -> Encoding:
        normalized = _normalize(text, self.normalization)
        tokens = list(normalized)
        if add_special_tokens:
            tokens = ["<BOS>", *tokens, "<EOS>"]
        unknown_id = self.token_to_id["<UNK>"]
        ids = tuple(self.token_to_id.get(token, unknown_id) for token in tokens)
        return Encoding(self.name, text, normalized, tuple(tokens), ids)

    def decode(self, ids: Sequence[int]) -> str:
        tokens = (self.id_to_token[int(idx)] for idx in ids)
        return "".join(token for token in tokens if token not in SPECIAL_TOKENS)


class Utf8ByteTokenizer:
    """Map raw UTF-8 bytes directly to IDs 0–255."""

    name = "UTF-8 bytes (raw)"
    _bos_id = 256
    _eos_id = 257

    @property
    def vocab_size(self) -> int:
        return 258

    @staticmethod
    def _token_label(value: int) -> str:
        if 32 <= value <= 126:
            return chr(value)
        return f"<0x{value:02X}>"

    def encode(self, text: str, *, add_special_tokens: bool = False) -> Encoding:
        byte_values = list(text.encode("utf-8"))
        ids = [*byte_values]
        tokens = [self._token_label(value) for value in byte_values]
        if add_special_tokens:
            ids = [self._bos_id, *ids, self._eos_id]
            tokens = ["<BOS>", *tokens, "<EOS>"]
        return Encoding(self.name, text, text, tuple(tokens), tuple(ids))

    def decode(self, ids: Sequence[int]) -> str:
        values = bytes(int(idx) for idx in ids if 0 <= int(idx) <= 255)
        return values.decode("utf-8", errors="replace")


class GreedySubwordTokenizer:
    """Use a fixed, lecture-sized vocabulary and deterministic longest match.

    The vocabulary is intentionally hand-selected and is not presented as a
    production BPE, WordPiece, or Unigram tokenizer.
    """

    def __init__(
        self,
        vocabulary_texts: Sequence[str],
        pieces: Sequence[str],
        *,
        normalization: Normalization = "NFC",
        name: str = "toy HPC subwords (NFC)",
    ) -> None:
        self.name = name
        self.normalization = normalization
        normalized_texts = tuple(_normalize(text, normalization) for text in vocabulary_texts)
        characters = set("".join(normalized_texts))
        normalized_pieces = {_normalize(piece, normalization) for piece in pieces}
        vocabulary = tuple(sorted(characters | normalized_pieces))
        self.id_to_token = SPECIAL_TOKENS + vocabulary
        self.token_to_id = {token: idx for idx, token in enumerate(self.id_to_token)}
        self.match_candidates = tuple(
            sorted(
                (token for token in vocabulary if token),
                key=lambda token: (-len(token), token),
            )
        )

    @property
    def vocab_size(self) -> int:
        return len(self.id_to_token)

    def encode(self, text: str, *, add_special_tokens: bool = False) -> Encoding:
        normalized = _normalize(text, self.normalization)
        tokens: list[str] = []
        cursor = 0
        while cursor < len(normalized):
            match = next(
                (piece for piece in self.match_candidates if normalized.startswith(piece, cursor)),
                "<UNK>",
            )
            tokens.append(match)
            cursor += 1 if match == "<UNK>" else len(match)
        if add_special_tokens:
            tokens = ["<BOS>", *tokens, "<EOS>"]
        ids = tuple(self.token_to_id.get(token, self.token_to_id["<UNK>"]) for token in tokens)
        return Encoding(self.name, text, normalized, tuple(tokens), ids)

    def decode(self, ids: Sequence[int]) -> str:
        tokens = (self.id_to_token[int(idx)] for idx in ids)
        return "".join(token for token in tokens if token not in SPECIAL_TOKENS)


def build_demo_tokenizers() -> dict[str, TeachingTokenizer]:
    """Create the offline Part A tokenizers."""

    return {
        "raw_codepoints": CodePointTokenizer(
            DEMO_TEXTS,
            normalization=None,
            name="Unicode code points (raw)",
        ),
        "nfc_codepoints": CodePointTokenizer(
            DEMO_TEXTS,
            normalization="NFC",
            name="Unicode code points (NFC)",
        ),
        "utf8_bytes": Utf8ByteTokenizer(),
        "toy_subwords": GreedySubwordTokenizer(DEMO_TEXTS, DEMO_SUBWORDS),
    }


def _visible_token(token: str) -> str:
    escaped = token.encode("unicode_escape").decode("ascii")
    return f"'{escaped}'"


def format_encoding(encoding: Encoding) -> str:
    """Format tokens and IDs without requiring pandas or notebook widgets."""

    tokens = ", ".join(_visible_token(token) for token in encoding.tokens)
    ids = ", ".join(str(idx) for idx in encoding.ids)
    normalized = ""
    if encoding.normalized_text != encoding.original_text:
        normalized = f"\n  normalized: {encoding.normalized_text!r}"
    return (
        f"{encoding.tokenizer_name}: count={encoding.count}{normalized}\n"
        f"  tokens: [{tokens}]\n"
        f"  ids:    [{ids}]"
    )


def format_cost_comparison(
    text: str,
    tokenizers: Sequence[TeachingTokenizer],
) -> str:
    """Compare token count and the dense-attention T² interaction proxy."""

    rows: list[tuple[str, int, int]] = []
    for tokenizer in tokenizers:
        count = tokenizer.encode(text).count
        rows.append((tokenizer.name, count, count * count))
    width = max(len(name) for name, _, _ in rows)
    lines = [f"{'tokenizer':<{width}}  tokens T  attention-score pairs T²"]
    for name, count, pairs in rows:
        lines.append(f"{name:<{width}}  {count:>8}  {pairs:>24}")
    return "\n".join(lines)


def configure_determinism(seed: int = SEED) -> None:
    """Configure deterministic, single-threaded CPU execution."""

    random.seed(seed)
    torch.manual_seed(seed)
    torch.set_num_threads(1)
    with suppress(RuntimeError):
        torch.set_num_interop_threads(1)
    torch.use_deterministic_algorithms(True)


def load_corpus(path: str | Path) -> str:
    return Path(path).read_text(encoding="utf-8")


def build_training_tokenizer(corpus: str) -> CodePointTokenizer:
    return CodePointTokenizer(
        (corpus,),
        normalization="NFC",
        name="training code points (NFC)",
    )


def encode_repeated_corpus(
    corpus: str,
    tokenizer: CodePointTokenizer,
    *,
    repeats: int = 12,
) -> Tensor:
    encoding = tokenizer.encode(corpus * repeats)
    return torch.tensor(encoding.ids, dtype=torch.long)


def shifted_sequence(
    text: str,
    tokenizer: CodePointTokenizer,
) -> tuple[Encoding, Tensor, Tensor]:
    encoding = tokenizer.encode(text)
    ids = torch.tensor(encoding.ids, dtype=torch.long)
    if ids.numel() < 2:
        raise ValueError("A shifted sequence requires at least two token IDs.")
    return encoding, ids[:-1], ids[1:]


def make_batch(
    stream: Tensor,
    *,
    context_length: int,
    batch_size: int,
    generator: torch.Generator,
) -> tuple[Tensor, Tensor]:
    max_start = stream.numel() - context_length - 1
    if max_start < 0:
        raise ValueError("The token stream is shorter than context_length + 1.")
    starts = torch.randint(
        0,
        max_start + 1,
        (batch_size,),
        generator=generator,
    )
    offsets = torch.arange(context_length + 1)
    windows = stream[starts[:, None] + offsets[None, :]]
    return windows[:, :-1], windows[:, 1:]


class CausalSelfAttention(nn.Module):
    causal_mask: Tensor

    def __init__(self, d_model: int, n_heads: int, context_length: int) -> None:
        super().__init__()
        if d_model % n_heads:
            raise ValueError("d_model must be divisible by n_heads.")
        self.n_heads = n_heads
        self.head_dim = d_model // n_heads
        self.scale = 1.0 / math.sqrt(self.head_dim)
        self.qkv = nn.Linear(d_model, 3 * d_model)
        self.output = nn.Linear(d_model, d_model)
        self.register_buffer(
            "causal_mask",
            torch.tril(torch.ones(context_length, context_length, dtype=torch.bool)),
            persistent=False,
        )

    def forward(self, x: Tensor) -> Tensor:
        batch_size, sequence_length, d_model = x.shape
        qkv = self.qkv(x)
        qkv = qkv.view(batch_size, sequence_length, 3, self.n_heads, self.head_dim)
        qkv = qkv.permute(2, 0, 3, 1, 4)
        query, key, value = qkv.unbind(dim=0)
        scores = (query @ key.transpose(-2, -1)) * self.scale
        mask = self.causal_mask[:sequence_length, :sequence_length]
        scores = scores.masked_fill(~mask, torch.finfo(scores.dtype).min)
        weights = torch.softmax(scores, dim=-1)
        mixed = weights @ value
        mixed = mixed.transpose(1, 2).contiguous().view(batch_size, sequence_length, d_model)
        return cast(Tensor, self.output(mixed))


class TransformerBlock(nn.Module):
    def __init__(
        self,
        d_model: int,
        n_heads: int,
        d_ff: int,
        context_length: int,
    ) -> None:
        super().__init__()
        self.attention_norm = nn.LayerNorm(d_model)
        self.attention = CausalSelfAttention(d_model, n_heads, context_length)
        self.feed_forward_norm = nn.LayerNorm(d_model)
        self.feed_forward = nn.Sequential(
            nn.Linear(d_model, d_ff),
            nn.GELU(),
            nn.Linear(d_ff, d_model),
        )

    def forward(self, x: Tensor) -> Tensor:
        x = x + self.attention(self.attention_norm(x))
        return cast(Tensor, x + self.feed_forward(self.feed_forward_norm(x)))


class TinyCausalTransformer(nn.Module):
    """One-block decoder-only Transformer for mechanism demonstration."""

    def __init__(
        self,
        *,
        vocab_size: int,
        context_length: int = 32,
        d_model: int = 32,
        n_heads: int = 4,
        d_ff: int = 64,
    ) -> None:
        super().__init__()
        self.context_length = context_length
        self.token_embedding = nn.Embedding(vocab_size, d_model)
        self.position_embedding = nn.Embedding(context_length, d_model)
        self.block = TransformerBlock(d_model, n_heads, d_ff, context_length)
        self.final_norm = nn.LayerNorm(d_model)
        self.lm_head = nn.Linear(d_model, vocab_size, bias=False)
        self.lm_head.weight = self.token_embedding.weight
        self.apply(self._initialize)

    @staticmethod
    def _initialize(module: nn.Module) -> None:
        if isinstance(module, (nn.Linear, nn.Embedding)):
            nn.init.normal_(module.weight, mean=0.0, std=0.02)
            if isinstance(module, nn.Linear) and module.bias is not None:
                nn.init.zeros_(module.bias)

    def forward(self, token_ids: Tensor) -> Tensor:
        _, sequence_length = token_ids.shape
        if sequence_length > self.context_length:
            raise ValueError(
                f"Sequence length {sequence_length} exceeds context {self.context_length}."
            )
        positions = torch.arange(sequence_length, device=token_ids.device)
        x = self.token_embedding(token_ids) + self.position_embedding(positions)
        x = self.block(x)
        return cast(Tensor, self.lm_head(self.final_norm(x)))


@dataclass
class TrainingResult:
    model: TinyCausalTransformer
    losses: dict[int, float]
    elapsed_seconds: float


def _evaluate_loss(model: TinyCausalTransformer, inputs: Tensor, targets: Tensor) -> float:
    model.eval()
    with torch.no_grad():
        logits = model(inputs)
        loss = F.cross_entropy(logits.reshape(-1, logits.size(-1)), targets.reshape(-1))
    return float(loss.item())


def train_tiny_model(
    token_stream: Tensor,
    *,
    vocab_size: int,
    seed: int = SEED,
    steps: int = 300,
    context_length: int = 32,
    batch_size: int = 24,
    learning_rate: float = 1e-2,
    checkpoints: Sequence[int] = (0, 25, 50, 100, 150, 200, 250, 300),
) -> TrainingResult:
    """Train the tiny decoder-only model on CPU and record fixed-batch loss."""

    configure_determinism(seed)
    model = TinyCausalTransformer(vocab_size=vocab_size, context_length=context_length)
    model.to(torch.device("cpu"))
    optimizer = torch.optim.AdamW(model.parameters(), lr=learning_rate)

    batch_generator = torch.Generator(device="cpu").manual_seed(seed + 1)
    evaluation_generator = torch.Generator(device="cpu").manual_seed(seed + 2)
    evaluation_inputs, evaluation_targets = make_batch(
        token_stream,
        context_length=context_length,
        batch_size=batch_size,
        generator=evaluation_generator,
    )

    requested = set(checkpoints)
    requested.add(0)
    requested.add(steps)
    losses = {0: _evaluate_loss(model, evaluation_inputs, evaluation_targets)}
    started = time.perf_counter()
    for step in range(1, steps + 1):
        model.train()
        inputs, targets = make_batch(
            token_stream,
            context_length=context_length,
            batch_size=batch_size,
            generator=batch_generator,
        )
        logits = model(inputs)
        loss = F.cross_entropy(logits.reshape(-1, vocab_size), targets.reshape(-1))
        optimizer.zero_grad(set_to_none=True)
        loss.backward()
        optimizer.step()
        if step in requested:
            losses[step] = _evaluate_loss(model, evaluation_inputs, evaluation_targets)
    elapsed = time.perf_counter() - started
    return TrainingResult(model=model, losses=losses, elapsed_seconds=elapsed)


def count_parameters(model: nn.Module) -> int:
    return sum(parameter.numel() for parameter in model.parameters())


def sample_text(
    model: TinyCausalTransformer,
    tokenizer: CodePointTokenizer,
    *,
    prompt: str,
    max_new_tokens: int = 48,
    seed: int = SEED + 3,
    temperature: float = 0.7,
    top_k: int = 3,
) -> str:
    """Seeded top-k sampling with fixed model weights."""

    if temperature <= 0:
        raise ValueError("temperature must be positive.")
    encoding = tokenizer.encode(prompt)
    generated = torch.tensor([encoding.ids], dtype=torch.long)
    generator = torch.Generator(device="cpu").manual_seed(seed)
    model.eval()
    with torch.no_grad():
        for _ in range(max_new_tokens):
            context = generated[:, -model.context_length :]
            logits = model(context)[:, -1, :] / temperature
            logits[:, : len(SPECIAL_TOKENS)] = -torch.inf
            values, indices = torch.topk(logits, k=min(top_k, logits.size(-1)), dim=-1)
            probabilities = torch.softmax(values, dim=-1)
            choice = torch.multinomial(probabilities, num_samples=1, generator=generator)
            next_token = indices.gather(-1, choice)
            generated = torch.cat((generated, next_token), dim=1)
    return tokenizer.decode(generated[0].tolist())
