"""Small convenience runner shared by the non-interactive examples (1–3).

Every example builds the same LangGraph agent (:func:`build_agent_graph`) and then
does the same three things: pick a model, run the graph once on a user prompt, and
print the message trace. Examples 2–3 additionally discover their tools from an MCP
server. Those two shared chores live here so each example is left with only what
makes it distinct: its tools, its system prompt, and its user prompt.

Example 4 (human-in-the-loop) does *not* use this runner — it needs a checkpointer
and an interrupt/resume loop, so it drives :func:`build_agent_graph` itself.
"""

from __future__ import annotations

from typing import Sequence

from langchain_core.tools import BaseTool
from langchain_mcp_adapters.client import MultiServerMCPClient

from atpesc_agentic.agent_graph import build_agent_graph
from atpesc_agentic.alcf_llm import build_alcf_llm, print_agent_messages


async def run_agent_once(
    tools: Sequence[BaseTool],
    system_prompt: str,
    user_prompt: str,
    *,
    llm_model: str | None = None,
    llm_base_url: str | None = None,
    model=None,
) -> dict:
    """Build the shared agent graph, run it once, print the trace, return the state.

    Args:
        tools: Tools the agent may call (local ``@tool`` objects or MCP tools).
        system_prompt: Instructions prepended to every model turn.
        user_prompt: The single user message that starts the run.
        llm_model: ALCF model id to use (falls back to ALCF_MODEL env / default).
        llm_base_url: ALCF endpoint URL (falls back to ALCF_BASE_URL env / default).
        model: Optional pre-built chat model; overrides ``llm_model`` /
            ``llm_base_url`` when supplied.

    Returns:
        The final graph state dict (contains the ``"messages"`` list).
    """

    agent = build_agent_graph(
        model=model or build_alcf_llm(model=llm_model, base_url=llm_base_url),
        tools=tools,
        system_prompt=system_prompt,
    )
    result = await agent.ainvoke(
        {"messages": [{"role": "user", "content": user_prompt}]}
    )
    print_agent_messages(result)
    return result


async def discover_mcp_tools(
    server_url: str,
    server_name: str = "mace",
    *,
    start_hint: str | None = None,
):
    """Connect to an MCP server over Streamable HTTP and return its tools.

    Args:
        server_url: The MCP endpoint, e.g. ``http://127.0.0.1:8000/mcp``.
        server_name: Label for the server in the client config.
        start_hint: Extra guidance appended to the connection-error message
            (e.g. which server script to start in another terminal).

    Returns:
        The list of tools the server exposes.
    """

    client = MultiServerMCPClient(
        {server_name: {"url": server_url, "transport": "http"}}
    )
    try:
        return await client.get_tools()
    except Exception as exc:
        message = f"Could not connect to {server_url}."
        if start_hint:
            message = f"{message} {start_hint}"
        raise RuntimeError(message) from exc
