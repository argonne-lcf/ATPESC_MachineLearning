# Getting Started with Cerebras Inference

## Step 1: Prerequisites

To complete setup, you will need:

- A Cerebras account
- A Cerebras Inference API key
- Python 3.7+

Visit [Cerebras Cloud platform here](https://cloud.cerebras.ai) to sign up for an account and create an
API key by navigating to "API Keys" on the left nav bar.


## Step 2: Setting up Your Environment

Set your API key as an environment variable. You can do this by running the following command in
your terminal:

```
export CEREBRAS_API_KEY="your-api-key-here"
```

Now create a Python virtual environment for installing relevant packages, for instance:

```
python -m venv /tmp/cb-inference
```

This directory includes a `requirements.txt` file with relevant packages to install into your
environment, including the Cerebras Inference library package `cerebras_cloud_sdk`. Activate your
environment and install the packages:

```
source /tmp/cb-inference/bin/activate
pip install -r requirements.txt
```

## Step 3: Run Inference

The Cerebras Inference cloud currently supports two models, `Llama 3.1 8B` and `Llama 3.1 70B`.
Try a simple chat completion with `Llama 3.1 8B` by running the below Python code snippet,
which can be found in `test.py` in this directory:

```
import os
from cerebras.cloud.sdk import Cerebras

client = Cerebras(
    # This is the default and can be omitted
    api_key=os.environ.get("CEREBRAS_API_KEY"),
)

chat_completion = client.chat.completions.create(
    messages=[
        {
            "role": "user",
            "content": "Why is fast inference important?",
        }
],
    model="llama3.1-8b",
)

print(chat_completion.model_dump_json(indent=2))
```

Now you're ready to run the examples. This directory includes two examples:
- [one demonstrating a simple chatbot application](1-simple-chatbot/README.MD),
- and [one demonstrating function calling](2-function-calling/README.MD).

## More Information

For more information, visit 
[Cerebras Inference documentation](https://inference-docs.cerebras.ai/introduction).
