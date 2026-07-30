# Simple Chatbot

This example implements a simple chatbot to show you how to use the Cerebras API to interact with
generative AI models. This script described here, which allows you to process chat completions in
an infinite loop, is implemented in `main.py`.

![finished product](image.png)

0. **Prerequisites**

   First setup your environment and API key as described [here](../README.MD).

1. **API Key Initialization**
   ```python
   client = Cerebras(api_key=os.environ.get("CEREBRAS_API_KEY"))
   ```
   The `Cerebras` client is initialized with an API key fetched from environment variables. This key is necessary for authenticating requests to the Cerebras API.

2. **User Input and Response Handling**
   ```python
   user_input = input("User: ")
   user_message = {"role": "user", "content": user_input}
   ```
   User input is collected and formatted into a message object.

3. **Model Interaction**
   ```python
   response = client.chat.completions.create(
       messages=[user_message],
       model="llama3.1-8b"
   )
   ```
   This API call sends the user message to the specified model (e.g., "llama3.1-8b") and retrieves the assistant’s response.

4. **Performance Metrics Calculation**
   ```python
   total_tokens = response.usage.total_tokens
   total_time = response.time_info.total_time
   tokens_per_second = total_tokens / total_time
   ```
   After receiving the response, the total tokens used and the total processing time are extracted from the response object. Tokens per second are then calculated by dividing the total tokens by the total time.
