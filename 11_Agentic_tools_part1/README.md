# Agentic Tools — Part 1: Hands-on with Hermes Agent

[Hermes Agent](https://github.com/NousResearch/hermes-agent) is a persistent,
single-operator agent harness (memory, skills, and routines survive across
sessions) that runs on your own laptop rather than in a vendor cloud.

By the end you will have Hermes installed, have sent a prompt to whatever
model it defaults to, then pointed it at ALCF's `gpt-oss-120b` endpoint and
prompted that model directly.

## 1. Install Hermes on your laptop

### CLI: macOS / Linux / WSL2 / Termux

```bash
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
source ~/.zshrc     # or ~/.bashrc — reload your shell so `hermes` is on PATH
```

### CLI: Windows (native PowerShell)

```powershell
iex (irm https://hermes-agent.nousresearch.com/install.ps1)
```

The installer bundles everything Hermes needs (uv, Python 3.11, Node.js,
ripgrep, ffmpeg) — no manual dependency wrangling. Config and state live
under `~/.hermes/` (macOS/Linux) or `%LOCALAPPDATA%\hermes` (native Windows).

### Desktop app (optional GUI)

Hermes also ships a native desktop app (macOS, Windows, Linux) — same agent,
config, keys, sessions, and skills as the CLI, just with a chat window, file
browser, terminal, and settings UI instead of a terminal prompt.

- **Easiest path (macOS/Windows):** download the Hermes Desktop installer
  from `https://hermes-agent.nousresearch.com/` and run it — it installs
  both the CLI and the desktop app together.
- **Already installed the CLI above?** Just run:

  ```bash
  hermes desktop
  ```

  This builds (first run only) and launches the packaged app using your
  existing config, keys, sessions, and skills — nothing to reconfigure.

## 2. Prompt the default model

The first launch runs a setup wizard so you can pick a provider/model — pick
whatever you already have credentials for (Anthropic, OpenAI, OpenRouter, or
[Nous Portal](https://portal.nousresearch.com) if you don't want to collect
separate API keys). If you'd rather use an existing Claude or ChatGPT
subscription instead of a fresh API key, see the Appendix.

```bash
hermes setup     # full wizard: provider, model, tools — configures everything
# or just:
hermes           # first run drops you into the same picker
```

Once you're in the chat, confirm it works with a real request:

```text
> Please create a PyTorch MNIST training script.
```

Then, as a follow-up in the same conversation:

```text
> Please run that code.
```

Watch for: does Hermes actually **execute** the script (not just describe
what it would do)? Does it install missing packages (`torch`,
`torchvision`) on its own? Does training loss actually drop over epochs?
That two-turn exchange is a genuine plan → act → observe loop — code
generation (file write) followed by code execution (terminal tool). The
first run downloads MNIST (~10 MB), so the machine running Hermes needs
outbound internet.

## 3. Point Hermes at ALCF's `gpt-oss-120b` endpoint

This adds ALCF Sophia as an *additional* provider — it does not touch your
default model from Step 2.

### Get a Globus access token

```bash
wget https://raw.githubusercontent.com/argonne-lcf/inference-endpoints/refs/heads/main/inference_auth_token.py
python inference_auth_token.py authenticate
echo "ALCF_INFERENCE_TOKEN=$(python inference_auth_token.py get_access_token)" >> ~/.hermes/.env
```

### Add the provider in `~/.hermes/config.yaml`

```yaml
# ~/.hermes/config.yaml -- adds an option, doesn't touch your default
providers:
  sophia:
    name: ALCF Sophia (gpt-oss)
    base_url: "https://inference-api.alcf.anl.gov/resource_server/sophia/vllm/v1"
    key_env: ALCF_INFERENCE_TOKEN
    transport: openai_chat
```

The Globus token is valid for ~48h — rerun the step above when it expires.
Sophia's vLLM pool cold-starts in 10–15 min if it has been idle.

## 4. Prompt `gpt-oss-120b`

Switch models for this conversation (this does not change your default):

```bash
hermes --provider sophia -m openai/gpt-oss-120b
```

or, from inside an already-running `hermes` session:

```text
/model sophia:openai/gpt-oss-120b
```

Then send it the same prompt you used in Step 2 and compare the two models'
behavior:

```text
> Please create a PyTorch MNIST training script.
> Please run that code.
```

### Known issue: tool calls fail with HTTP 422 (`extra_forbidden: name`)

Hermes attaches a legacy `name` field to every tool-result message; ALCF's
vLLM enforces a strict schema and rejects it. Confirmed on Hermes v0.20.0
(commit `a991dfc25`). One-line fix in
`~/.hermes/hermes-agent/agent/agent_runtime_helpers.py` — add this right
before the final `return messages` in `sanitize_api_messages()`:

```python
messages = [{k: v for k, v in m.items() if k not in ("name", "tool_name")} if isinstance(m, dict) and m.get("role") == "tool" else m for m in messages]
```

This is provider-agnostic and safe for every backend — it strips a field no
provider actually needs on a tool message. It has not been upstreamed yet,
so re-apply it after every `hermes update`.

## 5. Push it onto a real DOE system (discuss with your neighbor)

As a third turn in the same conversation:

```text
> Could you create a submission script on Polaris @ ALCF for this?
```

Did it get the queue, account/allocation flag, node & rank count, module
loads, and the `#!/bin/bash -l` shebang right — or did it **hallucinate**
ALCF-specific details it was never grounded in? Keep this in mind: closing
exactly that gap (giving an agent real, grounded facility knowledge) is what
the rest of the lecture — and Trinity — is about.

## Useful Links

- [Hermes Agent GitHub](https://github.com/NousResearch/hermes-agent)
- [Hermes documentation](https://hermes-agent.nousresearch.com/docs/)
- [ALCF Inference Endpoints](https://github.com/argonne-lcf/inference-endpoints)

## Appendix: Connect Hermes to a paid subscription

These are alternatives to a fresh per-provider API key in Step 2 — pick
whichever subscription you already pay for.

### A. Claude (Anthropic) — Claude Max

If you already have a Claude Max plan, Hermes can route through
**Anthropic OAuth** — the same credential Claude Code already uses.

**Interactive setup:**

```bash
hermes model
# -> select "Anthropic OAuth"  (routes as Claude Code)
```

**Manual `config.yaml`:**

```yaml
model:
  provider: "anthropic"
  default: "claude-sonnet-4-6"   # or whichever Claude model your OAuth session exposes
```

> **Requires a Claude Max plan with extra usage credits purchased** — your
> base Max allowance is not consumed by Hermes, and **Claude Pro accounts
> cannot use this path**. Without Max + extra credits, set
> `ANTHROPIC_API_KEY` in `~/.hermes/.env` and use `provider: "anthropic"`
> instead — that bills pay-per-token against the key's own organization.

### B. OpenAI — ChatGPT subscription (Codex)

If you already have a ChatGPT Plus, Pro, or Team subscription, Hermes can
route through **ChatGPT OAuth** to use Codex models — no separate API key
needed.

**Interactive setup:**

```bash
hermes model
# -> select "OpenAI Codex"  (opens a browser device-code login)
```

Hermes stores the resulting credentials in its own auth store
(`~/.hermes/auth.json`) and can import existing Codex CLI credentials from
`~/.codex/auth.json` if present — no Codex CLI install required.

**Manual `config.yaml`:**

```yaml
model:
  provider: "openai-codex"
  default: "gpt-5.5"   # or whichever Codex model your OAuth session exposes
```

> This path is billed against your ChatGPT subscription's Codex allowance.
> For pay-per-token direct API access instead, set `OPENAI_API_KEY` in
> `~/.hermes/.env` and use `provider: "openai-api"`.

## Acknowledgements

> This research used resources of the Argonne Leadership Computing Facility,
> which is a DOE Office of Science User Facility supported under Contract
> DE-AC02-06CH11357.
