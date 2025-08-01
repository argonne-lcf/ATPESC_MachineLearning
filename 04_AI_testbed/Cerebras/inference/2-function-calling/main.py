
import os
import json
from pydantic import BaseModel, Field
from cerebras.cloud.sdk import Cerebras


# Define our tools
# Perform a simple sum
def simple_sum(x: float, y: float) -> float:
    return x+y

class CalculateSimpleSum(BaseModel):
    x: float = Field(..., description="The x value to be summed.")
    y: float = Field(..., description="The y value to be summed.")

# Perform a simple product
def product(x: float, y: float) -> float:
    return x*y

class CalculateProduct(BaseModel):
    x: float = Field(..., description="The x value to be multiplied.")
    y: float = Field(..., description="The y value to be multiplied.")

# Perform a foobar, defined as 2*x - y
def foobar(x: float, y: float) -> float:
    return 2*x-y

class CalculateFoobar(BaseModel):
    x: float = Field(..., description="The x value to be foobared.")
    y: float = Field(..., description="The y value to be foobared.")


# Define the tool schema
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
