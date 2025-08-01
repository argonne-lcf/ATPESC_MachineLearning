# Example 2: Function Calling

This example implements an AI agent which can use tools via function calling to complete tasks.

Our standard interactions with LLMs typically involve prompting the model for a response generated
either from the model’s training data or external data provided in the prompt. Tool use extends an
LLM’s capabilities by enabling an AI agent to interact with its environment using tools essential
for completing assigned tasks. For example, these tools can allow the AI agent to retrieve data
from external sources and write to them.

In the context of AI agents, tools are simply functions that execute specific pieces of code. The
tools available to the model are defined in a tool schema, which includes the tool’s name,
description, available parameters, and a description of what each parameter does. When an AI agent
is prompted to complete a task, it refers to the tool schema to select the appropriate tool for
that task.

In this example, we implement three functions for performing a sum, a product, and a made-up
operation called a foobar. Based on the user request to the model, the agent can choose to use one
of these tools to perform its task.

0. **Prerequisites:**

   First setup your environment and API key as described [here](../README.MD).
   See [the previous example](../1-simple-chatbot/README.MD) for a basic introduction to the
   Cerebras inference API.

1. **Defining Basic Tools:**

   We define three functions, `simple_sum`, `product`, and `foobar`, to perform math operations on
   floats. We wrap these in a Pydantic object to provide data validation and a JSON schema to
   pass to the model.

   For example, our `foobar` function, which returns twice the first argument minus the second
   argument, is defined as follows:

   ```
   def foobar(x: int, y: int) -> int:
       return 2*x-y
   
   class CalculateFoobar(BaseModel):
       x: int = Field(..., description="The x value to be foobared.")
       y: int = Field(..., description="The y value to be foobared.")
   ```

2. **Defining the Tool Schema:**

   Next, we need to provide a JSON schema that will be passed to the model defining the available
   tools and their use.

   ```
   tools = [
       {
           "type": "function",
           "function": {
               "name": "simple_sum",
               "description": "Calculate a sum of two numbers.",
               "parameters": CalculateSimpleSum.model_json_schema(),
           },
       },
       {
           "type": "function",
           "function": {
               "name": "product",
               "description": "Calculate a product of two numbers.",
               "parameters": CalculateSimpleSum.model_json_schema(),
           },
       },
       {
           "type": "function",
           "function": {
               "name": "foobar",
               "description": "Calculate a foobar of two numbers.",
               "parameters": CalculateFoobar.model_json_schema(),
           },
       }
   ]
   ```

3. **Client Initialization and User Input:**

   We then need to initialize the client, take input from the user, and pass to the model, along
   with the tool schema. Notice that we pass a system message to the model directing it to use
   the supplied tools.

   ```
   # Initialize client
   client = Cerebras(
       api_key=os.environ.get("CEREBRAS_API_KEY"),
   )
   
   # Ask for user input
   user_input = input("User: ")
   
   # Create message to pass to model
   messages = [
       {"role": "system", "content": "You are a helpful calculator. Use the supplied tools to assist the user."},
       {"role": "user", "content": user_input},
   ]
   
   # Generate response from model
   response = client.chat.completions.create(
       model="llama3.1-8b",
       messages=messages,
       tools=tools,
   )
   ```

4. **Parsing Response and Using Tools**

   Once we've received the model's response, we can parse it to look for requested tool usage. If
   it determines that a specific tool should be used, we apply that tool to the arguments parsed by
   the model.
   
   ```
   content = response.choices[0].message.content
   tool_calls = response.choices[0].message.tool_calls
   
   if content:
       print("The assistant did not use a tool. Produced following response: ")
       print(content)
   
   elif tool_calls:
       function_call = tool_calls[0].function
       arguments = json.loads(function_call.arguments)
       if function_call.name == "simple_sum":
           result = simple_sum(**arguments)
           print("The assistant used the sum tool to produce: ", result)
       if function_call.name == "product":
           result = product(**arguments)
           print("The assistant used the product tool to produce: ", result)
       if function_call.name == "foobar":
           result = foobar(**arguments)
           print("The assistant used the foobar tool to produce: ", result)
   ```
