import os                                                                                           
import json
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
