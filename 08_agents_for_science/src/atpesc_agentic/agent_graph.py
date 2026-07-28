"""An explicit LangGraph ReAct agent, built from primitives.

The tutorial deliberately does *not* call a prebuilt one-liner such as
``langchain.agents.create_agent`` or ``langgraph.prebuilt.create_react_agent``.
Instead it wires the graph by hand so the mechanics are visible:

    START -> llm -> (tool calls?) -> tools -> llm -> ... -> END

``llm`` asks the model what to do next. ``tools`` executes any tool calls the
model requested and feeds the results back. ``tools_condition`` is the router:
if the model's last message contains tool calls, go to ``tools``; otherwise the
model produced a final answer, so stop.

This one graph is the shared "agent core"; every example supplies its own tools
and system prompt (the thin adapter layer) and calls :func:`build_agent_graph`.
"""

from __future__ import annotations

from typing import Sequence

import json

from langchain_core.language_models import BaseChatModel
from langchain_core.messages import SystemMessage, ToolMessage
from langchain_core.tools import BaseTool
from langgraph.graph import END, START, MessagesState, StateGraph
from langgraph.prebuilt import ToolNode, tools_condition


def _stringify_tool_content(messages):
    """Coerce list-form ToolMessage content into a plain string.

    ``langchain-mcp-adapters`` returns tool results as a list of content blocks
    (e.g. ``[{"type": "text", "text": ...}]``), so the resulting ToolMessage has
    list content. The ALCF vLLM (OpenAI-compatible) endpoint requires ``tool``
    message content to be a string and rejects the list form with HTTP 422. We
    flatten text blocks to a string here; local ``@tool`` results are already
    strings, so this is a no-op for Examples 1 and 4.
    """

    normalized = []
    for message in messages:
        if isinstance(message, ToolMessage) and isinstance(message.content, list):
            parts = []
            for block in message.content:
                if isinstance(block, str):
                    parts.append(block)
                elif isinstance(block, dict) and "text" in block:
                    parts.append(block["text"])
                else:
                    parts.append(json.dumps(block))
            message = message.model_copy(update={"content": "".join(parts)})
        normalized.append(message)
    return normalized


def build_agent_graph(
    model: BaseChatModel,
    tools: Sequence[BaseTool],
    system_prompt: str,
    checkpointer=None,
):
    """Compile an explicit ReAct-style LangGraph agent.

    Args:
        model: A chat model (e.g. the ALCF ``ChatOpenAI``).
        tools: The tools the agent may call.
        system_prompt: Instructions prepended to every model turn.
        checkpointer: Optional LangGraph checkpointer. Passing one makes the
            graph durable and enables ``interrupt`` / resume (see Example 4).

    Returns:
        A compiled graph exposing ``.invoke`` / ``.ainvoke`` and returning a
        state dict with a ``"messages"`` list.
    """

    # Bind the tool schemas to the model so it can emit structured tool calls.
    model_with_tools = model.bind_tools(tools)

    # Node 1: call the model. We prepend the system prompt on every turn rather
    # than storing it in state, so the conversation history stays clean.
    def call_model(state: MessagesState) -> dict:
        history = _stringify_tool_content(state["messages"])
        messages = [SystemMessage(content=system_prompt), *history]
        return {"messages": [model_with_tools.invoke(messages)]}

    # Node 2: execute whatever tool calls the model requested. ToolNode reads
    # the tool calls off the last message and appends ToolMessages with results.
    tool_node = ToolNode(tools)

    graph = StateGraph(MessagesState)
    graph.add_node("llm", call_model)
    graph.add_node("tools", tool_node)

    graph.add_edge(START, "llm")
    # Router: "llm" -> "tools" when tool calls are present, else "llm" -> END.
    graph.add_conditional_edges("llm", tools_condition, {"tools": "tools", END: END})
    # After tools run, loop back so the model can use the results.
    graph.add_edge("tools", "llm")

    return graph.compile(checkpointer=checkpointer)
