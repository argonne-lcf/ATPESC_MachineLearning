# Inference using the SambaNova Cloud

[SambaNova Cloud](https://cloud.sambanova.ai/) is an API service for inference at record-breaking speeds. 

## Quick Start Guide

Get started using the SambaNova Cloud API in just a few minutes!

### Get your API key

1. Create an account on the [SambaNova Cloud Developer Portal](https://cloud.sambanova.ai/) to get an API key.
2. Once logged in, navigate to the APIs section and generate a new key. 
3. Set your API key as an environment variable:
   ```shell
   export SAMBANOVA_API_KEY="your-api-key-here"
   ```

### Pick a model

The SambaNova cloud offers the latest open source models running at the fastest tokens per second.

To make an inference request from a model, you’ll need the model’s corresponding model-id. The full list of models and corresponding model-id’s are [listed here](https://community.sambanova.ai/t/supported-models/193).

### Make an API request

You can make an inference request to our models in Python using two approaches:
1. LangChain connectors (refer to the AI Starter Kits documentation).
2. Open AI client library (see the example below).

#### OpenAI client library

Install the OpenAI Python library using pip, as shown below:
```shell  
pip install openai
```

#### Run Example

Then run the file as shown below:
```shell  
python hello_world.py
```

## AI Starter Kits

[SambaNova AI Starter Kits](https://github.com/sambanova/ai-starter-kit/) are a collection of open-source examples and guides to facilitate the deployment of AI-driven use cases, designed to support both enterprises and developers in their AI adoption journeys.

<!-- Start by cloning the starter kit repo:
```
git clone https://github.com/sambanova/ai-starter-kit.git
```

Then, update the API information by configuring the environment variables in the `ai-starter-kit/.env` file:
- Create the `.env` file at `ai-starter-kit/.env` if the file does not exist.
- Enter the SambaNova Cloud API key in the `.env` file, for example:
  
```bash
SAMBANOVA_API_KEY = "your-api-key-here"
```

**Note**: If you've already set your API key as an environment variable (for example, in your `.bashrc` or `.zshrc`), there's no need to create the `.env` file.

Below are three examples you can try. **We recommend using Python >= 3.10 and < 3.12**. 

### Example 1: Function Calling Basics 

After cloning the repository, go to `ai-starter-kit/quickstart`. Then, run the [function_calling_get_started.ipynb](https://github.com/sambanova/ai-starter-kit/blob/main/quickstart/function_calling_get_started.ipynb) notebook. 

### Example 2: Complete Function Calling App

This function calling kit is an example of tools calling implementation and a generic function calling module that can be used inside your application workflows. To build a complete function calling app, [click on this AI Starter Kit](https://github.com/sambanova/ai-starter-kit/blob/main/function_calling). 

### Example 3: Complete Document Knowledge Retriever App

The document knowledge retriever Kit allows you to quickly build a semantic search retrieval-augmented generation (RAG) application with Langchain and Streamlit in Python. To build a complete document knowledge retriever app, [click on this AI Starter Kit](https://github.com/sambanova/ai-starter-kit/blob/main/enterprise_knowledge_retriever).  -->






