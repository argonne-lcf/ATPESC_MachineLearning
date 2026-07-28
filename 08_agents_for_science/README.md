# 08 — Agentic AI for Scientific Workflows

**ATPESC 2026** · Author: Thang Pham, ANL (tpham[at]anl.gov)

**Goal:** build a scientific agent step by step — a LangGraph agent that calls a
MACE energy tool, then the same tool over MCP, then distributed across HPC with
Parsl, then gated by a human-in-the-loop approval — all driven by an LLM served
from the [ALCF inference endpoints](https://docs.alcf.anl.gov/services/inference-endpoints/#web-ui).

Four standalone Python examples build one scientific agent step by step:

1. LangGraph agent + a directly decorated MACE tool.
2. The same calculation behind an MCP Streamable HTTP server.
3. An MCP ensemble tool that dispatches MACE calculations through Parsl.
4. A human approval tool with durable LangGraph SQLite checkpoints.

The examples are independent of ChemGraph. They borrow the useful design
pattern—one scientific core with thin agent and execution adapters—but do not
import, modify, or require ChemGraph.

## Quickstart

```bash
./install.sh                      # build the environment (Aurora)
source activate.sh                # each new shell
python scripts/check_setup.py     # confirm environment + ALCF token
python examples/01_langgraph_mace.py --structure data/structures/water.xyz --backend emt
```

`--backend emt` is a lightweight sanity check that exercises the agent without a
MACE calculation; use `--backend mace --device xpu` for the real thing on Aurora.
Every example needs an ALCF token for the LLM that drives the agent — see
[ALCF inference token](#alcf-inference-token) below if `check_setup.py` reports it
missing.

## The important file

[`src/atpesc_agentic/run_mace_core.py`](src/atpesc_agentic/run_mace_core.py)
contains ordinary scientific Python:

```python
result = run_mace_core(
    structure_path="data/structures/water.xyz",
    model="small",
    device="cpu",
    backend="mace",
)
```

It contains no LangGraph, LangChain, MCP, or Parsl imports. Each example keeps
its decorator next to the agent code so the adaptation is visible:

```python
@tool
def run_mace(...):
    return run_mace_core(...).model_dump()
```

```python
@mcp.tool()
def run_mace(...):
    return run_mace_core(...).model_dump()
```

Every example builds its agent from the same explicit LangGraph graph in
[`src/atpesc_agentic/agent_graph.py`](src/atpesc_agentic/agent_graph.py) —
`START → llm → tools → llm → … → END` wired by hand with `StateGraph`,
`ToolNode`, and `tools_condition`, rather than a prebuilt one-liner. The graph
mechanics stay visible; each example only supplies its tools and system prompt.

One scientific core, one agent graph, and a thin adapter that grows each step:

```text
run_mace_core.py  (pure science, no frameworks)
        │  wrapped by a thin adapter in each example
        ▼
 1: @tool  →  2: @mcp.tool over HTTP  →  3: + Parsl ensemble  →  4: + human approval
        └──────────── all share agent_graph.py (START→llm→tools→llm→END) ───────────┘
```

Examples 1–3 share one runner,
[`run_agent_once`](src/atpesc_agentic/agent_runner.py) (plus `discover_mcp_tools`
for the MCP examples), so each script is left with just its tools, system prompt,
and user prompt. Example 4 keeps its own driver because it adds a durable
checkpointer and a human-approval interrupt/resume loop.

## Installation

Run the one-step installer from an Aurora node:

```bash
./install.sh
```

It builds a single environment with everything the module needs:

- `module load frameworks` for Intel's XPU-enabled PyTorch (IPEX, oneCCL);
- a `.venv` created with `--system-site-packages` so it inherits that XPU torch;
- the ATPESC package plus Parsl, SQLite human-in-the-loop, and pytest
  (`pip install -e .`);
- MACE for Aurora XPU — the [alcf-dev fork](https://github.com/tdpham2/mace/tree/alcf-dev)
  installed with `--no-deps` so it uses the system XPU torch instead of pulling an
  upstream CUDA build.

Then activate the environment in every new shell:

```bash
source activate.sh
```

`activate.sh` reloads the frameworks module, activates the venv, and sets the
MACE model cache. By default the cache is `<repo>/mace_models`; point it at a
pre-staged or shared location by exporting `MACE_CACHE_DIR` before sourcing:

```bash
export MACE_CACHE_DIR=/lus/flare/projects/<project>/mace_models
source activate.sh
```

MACE foundation models download their weights into `$MACE_CACHE_DIR/mace/` the
first time they are used.

### ALCF inference token

The examples call an LLM served by the ALCF inference endpoints, which
authenticate with a Globus-issued access token. The bundled
[`scripts/inference_auth_token.py`](scripts/inference_auth_token.py) (from
[argonne-lcf/inference-endpoints](https://github.com/argonne-lcf/inference-endpoints))
handles login and token refresh.

**First time — log in once (opens a Globus browser/device flow):**

```bash
python scripts/inference_auth_token.py authenticate
```

After that the token is cached under `~/.globus/` and auto-refreshes; you do not
need to log in again (until ~6 months of inactivity). `build_alcf_llm()` fetches
and refreshes the token for you, so **no export is required**.

To print the current token (e.g. for `curl` or other tools), or check its
lifetime:

```bash
python scripts/inference_auth_token.py get_access_token
python scripts/inference_auth_token.py get_time_until_token_expiration --units minutes
```

A convenience wrapper exports it into your shell:

```bash
source scripts/get_alcf_token.sh   # sets ALCF_ACCESS_TOKEN for this shell
```

**Optional overrides** (`.env.example` documents them):

```bash
export ALCF_MODEL="openai/gpt-oss-120b"   # default; ask the instructor for others
export ALCF_BASE_URL="https://inference-api.alcf.anl.gov/resource_server/sophia/vllm/v1"
export ALCF_ACCESS_TOKEN="..."       # pin a specific token instead of auto-fetch
```

If `ALCF_ACCESS_TOKEN` is set it takes precedence; otherwise the Globus token is
used automatically. See the
[ALCF inference docs](https://docs.alcf.anl.gov/services/inference-endpoints/#web-ui).

## MACE versus the teaching fallback

All scientific examples default to `--backend mace`. A small `--backend emt`
mode lets participants exercise agent, MCP, Parsl, and checkpoint mechanics on
a laptop without downloading MACE.

EMT is not MACE, its energies are not interchangeable with MACE energies, and
the code never silently changes backends. Every result records its backend.

## Example 1 — direct LangGraph tool

The `@tool` wrapper is defined in `examples/01_langgraph_mace.py`.

```bash
python examples/01_langgraph_mace.py \
  --structure data/structures/water.xyz \
  --mace-model small \
  --device cpu \
  --backend mace
```

For a fast laptop check:

```bash
python examples/01_langgraph_mace.py \
  --structure data/structures/water.xyz \
  --backend emt
```

The program prints the tool schema and the complete agent message/tool trace.

## Example 2 — MCP over Streamable HTTP

Use two terminals. The structure path sent by the agent is made absolute so it
resolves correctly in the server process.

Terminal 1:

```bash
python examples/02_mcp_server.py --host 127.0.0.1 --port 8000
```

Terminal 2:

```bash
python examples/02_mcp_agent.py \
  --server-url http://127.0.0.1:8000/mcp \
  --structure data/structures/water.xyz \
  --backend emt
```

The client discovers the remote schema before constructing the agent. Stop the
server with `Ctrl-C`. If the port is occupied, select another port in both
commands.

## Example 3 — MCP + Parsl ensemble

The ensemble server exposes both `run_mace` and `run_mace_ensemble`. Parsl is
initialized lazily when the ensemble tool is first called and reused until the
server exits. The MACE core intentionally creates a fresh calculator per call;
the tutorial does not add caching or thread synchronization.

Terminal 1:

```bash
python examples/03_ensemble_server.py \
  --execution-target local \
  --port 8001 \
  --max-workers 3
```

Terminal 2:

```bash
python examples/03_ensemble_agent.py \
  --server-url http://127.0.0.1:8001/mcp \
  --backend emt \
  data/structures/water.xyz \
  data/structures/methane.xyz \
  data/structures/ammonia.xyz
```

Results remain ordered by resolved structure path. One failed structure is
reported without discarding the successful results.

### Aurora

Start the server from an Aurora compute node inside an active PBS allocation.
The worker initialization must activate the same shared environment on every
node:

```bash
export ATPESC_AURORA_WORKER_INIT="source /path/to/repo/activate.sh; export TMPDIR=/tmp"

python examples/03_ensemble_server.py \
  --execution-target aurora \
  --port 8001
```

`activate.sh` already runs `module load frameworks` and activates the venv, so it
is the single command each Parsl worker needs to reproduce the environment.

Then connect from a second shell on the same node:

```bash
python examples/03_ensemble_agent.py \
  --server-url http://127.0.0.1:8001/mcp \
  --device xpu \
  --backend mace \
  data/structures/*.xyz
```

The Aurora configuration:

- reads the active allocation from `PBS_NODEFILE`;
- launches one Parsl block across the allocation with `MpiExecLauncher`;
- uses interface `bond0`;
- exposes GPU tiles `0.0` through `5.1` to each node's workers;
- relies on Parsl to assign `ZE_AFFINITY_MASK`; and
- forces MACE to use `float32` for XPU.

Do not bind the server to a public interface unless authentication and network
policy have been addressed.

## Example 4 — human in the loop

Start a workflow (SQLite checkpoints are part of the single install):

```bash
python examples/04_human_in_the_loop.py \
  --structure data/structures/water.xyz \
  --backend emt \
  --checkpoint-db runs/hitl.sqlite \
  --thread-id demo-water
```

The agent calls `ask_human` before `run_mace`. At the prompt, enter `approved`,
`denied`, or a revision such as `Approve, but use model=medium`.

To demonstrate recovery across processes, leave the interrupt pending:

```bash
python examples/04_human_in_the_loop.py \
  --structure data/structures/water.xyz \
  --backend emt \
  --thread-id restart-demo \
  --leave-pending
```

Resume it later with the same database and thread:

```bash
python examples/04_human_in_the_loop.py \
  --checkpoint-db runs/hitl.sqlite \
  --thread-id restart-demo \
  --resume approved
```

## Tests

```bash
pytest
```

The default tests use EMT and do not contact an LLM. Real MACE and live ALCF
calls are rehearsal checks rather than ordinary unit tests.

## Layout

```text
examples/
  01_langgraph_mace.py
  02_mcp_server.py
  02_mcp_agent.py
  03_ensemble_server.py
  03_ensemble_agent.py
  04_human_in_the_loop.py
src/atpesc_agentic/
  alcf_llm.py                 # ALCF inference LLM + Globus token auto-fetch
  agent_graph.py              # explicit LangGraph ReAct agent (shared by examples)
  agent_runner.py             # shared runner + MCP tool discovery (examples 1-3)
  run_mace_core.py
  parsl_config.py
  run_mace_ensemble_core.py
scripts/
  inference_auth_token.py     # Globus login / token refresh (ALCF)
  get_alcf_token.sh           # convenience wrapper -> exports ALCF_ACCESS_TOKEN
data/structures/
tests/
```

The examples run entirely from the terminal.
