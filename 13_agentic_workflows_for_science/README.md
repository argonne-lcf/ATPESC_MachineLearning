# 13 — Agentic AI for Scientific Workflows

**ATPESC 2026** · Author: Thang Pham, ANL (tpham[at]anl.gov)

**Goal:** build a scientific agent step by step: a LangGraph agent that calls a
MACE tool to calculate the energy of a molecule, then the same tool over MCP, then distributed across HPC with
Parsl, then gated by a human-in-the-loop approval, all driven by an LLM served
from the [ALCF inference service](https://docs.alcf.anl.gov/services/inference-endpoints/#web-ui).

Four standalone Python examples build one scientific agent step by step:

1. LangGraph agent + a directly decorated MACE tool.
2. The same calculation behind an MCP Streamable HTTP server.
3. An MCP ensemble tool that dispatches MACE calculations through Parsl.
4. A human approval tool with durable LangGraph SQLite checkpoints.

The examples are independent of ChemGraph. They borrow the useful design
pattern with one scientific core with thin agent and execution adapters, but do not
import, modify, or require ChemGraph.

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
`START → llm → tools → llm → … → END` with `StateGraph`,`ToolNode`, and `tools_condition`.
The graph mechanics stay visible; each example only supplies its tools and system prompt.

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

## Getting Started
This demo is designed to be run interactively on an Aurora node

```bash
qsub -I -A ATPESC2026 -q ATPESC -l select=1 -l walltime=0:60:0 -l filesystems=home:flare
```

Once your interactive job has started, activate the demo environment:
```bash
module load frameworks
source activate.sh # Activate the example environment
```

If you would like to build the demo environment at a later date, the included `install.sh` file can be used.

## For using ALCF inference service from Aurora compute node
```bash
export http_proxy="proxy.alcf.anl.gov:3128"
export https_proxy="proxy.alcf.anl.gov:3128"
```

If you have not done this step earlier to authenticate with ALCF inference service
```bash
python scripts/inference_auth_token.py authenticate
```
This will prompt a link that requires you to authenticate with Globus. After authentication:
```bash
source scripts/get_alcf_token.sh   # sets ALCF_ACCESS_TOKEN for this shell
```

## Example 1 — direct LangGraph tool

```bash
python examples/01_langgraph_mace.py \
  --structure data/structures/water.xyz \
  --mace-model small \
  --device cpu \
  --backend mace
```

## Example 2 — MCP over Streamable HTTP

Use two terminals. The structure path sent by the agent is made absolute so it
resolves correctly in the server process.

Terminal 1:

```bash
python examples/02_mcp_server.py --host 127.0.0.1 --port 8000
```

Terminal 2:

```bash
export NO_PROXY=127.0.0.1,localhost,::1
export no_proxy=127.0.0.1,localhost,::1

python examples/02_mcp_agent.py \
  --server-url http://127.0.0.1:8000/mcp \
  --structure data/structures/water.xyz \
  --backend mace \
  --device xpu
```

## Example 3 — MCP + Parsl ensemble on Aurora

Start the server from an Aurora compute node inside an active PBS allocation
with the demo `.venv` activated. By default the Parsl workers load the
`frameworks` module and re-activate the submitter's virtualenv so
`torch.xpu.is_available()` returns `True` on each worker.

Parsl needs `PBS_NODEFILE` to size the Aurora block — it reads the file to
count the nodes in your allocation. That variable is only set in the shell
where you ran `qsub -I`, so launch Terminal 1 from that shell. Confirm it is
pointing at your job's node list first:

```bash
echo "$PBS_NODEFILE"
cat  "$PBS_NODEFILE"     # lists the hostnames allocated to your job
```

If either is empty, you are not in the `qsub -I` shell. Either launch the
MCP server from that shell, or locate the `PBS_NODEFILE` for your job and
export it in the terminal you plan to use for Terminal 1.

Override the worker init with `ATPESC_WORKER_INIT` if you need a custom
snippet, for example to point workers at the shared ATPESC `activate.sh`:

```bash
export ATPESC_WORKER_INIT="source /lus/flare/projects/ATPESC2026/EXAMPLES/track-6-agentic-workflows-for-science/ATPESC_MachineLearning/13_agentic_workflows_for_science/activate.sh; export TMPDIR=/tmp"
```

Terminal 1:

```bash
python examples/03_ensemble_server.py --port 8001
```

Terminal 2:

```bash
# If you haven't set the proxy earlier
export NO_PROXY=127.0.0.1,localhost,::1
export no_proxy=127.0.0.1,localhost,::1

python examples/03_ensemble_agent.py \
  --server-url http://127.0.0.1:8001/mcp \
  --device xpu \
  --backend mace \
  data/structures/*.xyz
```

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
