# GPT-J on Cerebras

Go to the directory with the GPT-J example. 
```bash
cd ~/R_2.10.0/modelzoo/src/cerebras/modelzoo/models/nlp/gptj
```

Activate PyTorch virtual Environment 
```bash
source ~/R_2.10.0/venv_cerebras_pt/bin/activate
```

Replace config file with correct configurations file. 
```bash
cp /software/cerebras/dataset/gptj/params_gptj_6B_sampleds.yaml configs/params_gptj_6B_sampleds.yaml
```

Run Training Job
```bash
export MODEL_DIR=model_dir_gptj
if [ -d "$MODEL_DIR" ]; then rm -Rf $MODEL_DIR; fi
cszoo fit configs/params_gptj_6B_sampleds.yaml --job_labels name=gptj --model_dir $MODEL_DIR |& tee mytest.log
```
<details>
  <summary>Sample Output (last section)</summary>
  
  ```bash
2025-10-10 20:03:38,180 INFO:   Beginning appliance run
2025-10-10 20:05:52,476 INFO:   | Train Device=CSX, Step=50, Loss=9.44598, Rate=44.84 samples/sec, GlobalRate=44.70 samples/sec, LoopTimeRemaining=0:06:42, TimeRemaining>0:06:42
2025-10-10 20:08:06,526 INFO:   | Train Device=CSX, Step=100, Loss=8.34360, Rate=45.03 samples/sec, GlobalRate=44.73 samples/sec, LoopTimeRemaining=0:04:28, TimeRemaining>0:04:28
2025-10-10 20:10:20,442 INFO:   | Train Device=CSX, Step=150, Loss=8.21114, Rate=45.11 samples/sec, GlobalRate=44.75 samples/sec, LoopTimeRemaining=0:02:14, TimeRemaining>0:02:14
2025-10-10 20:12:34,522 INFO:   | Train Device=CSX, Step=200, Loss=8.01509, Rate=44.77 samples/sec, GlobalRate=44.75 samples/sec, LoopTimeRemaining=0:00:00, TimeRemaining>0:00:00
2025-10-10 20:12:34,527 INFO:   Saving checkpoint at step 200
2025-10-10 20:20:51,668 INFO:   Saved checkpoint model_dir_gptj/checkpoint_200.mdl
2025-10-10 20:21:14,280 INFO:   Training completed successfully!
2025-10-10 20:21:14,286 INFO:   Processed 24000 training sample(s) in 1443.67300221 seconds.
  ```
</details>
