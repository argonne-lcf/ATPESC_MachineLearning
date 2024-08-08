# Gpt-J on Cerebras

Go to the directory with the GPT-J example. 
```bash
cd ~/R_2.2.1/modelzoo/src/cerebras/modelzoo/models/nlp/gptj
```

Activate PyTroch virtual Environment 
```bash
source ~/R_2.2.1/venv_cerebras_pt/bin/activate
pip install -r ~/R_2.2.1/modelzoo/requirements.txt
```

Replace config file with correct configurations file. 
```bash
cp /software/cerebras/dataset/gptj/params_gptj_6B_sampleds.yaml configs/params_gptj_6B_sampleds.yaml
```

Run Training Job
```bash
export MODEL_DIR=model_dir_gptj
if [ -d "$MODEL_DIR" ]; then rm -Rf $MODEL_DIR; fi
python run.py CSX --job_labels name=gptj_pt --params configs/params_gptj_6B_sampleds.yaml --num_csx=2 --mode train --model_dir $MODEL_DIR --mount_dirs /home/ /software --python_paths /home/$(whoami)/R_2.2.1/modelzoo/src --compile_dir $(whoami) |& tee mytest.log
```
<details>
  <summary>Sample Output (last section)</summary>
  
  ```bash
     2023-11-29 20:59:19,223 INFO:   Beginning appliance run
2023-11-29 21:03:53,875 INFO:   | Train Device=CSX, Step=100, Loss=8.43750, Rate=43.70 samples/sec, GlobalRate=43.70 samples/sec
2023-11-29 21:08:28,779 INFO:   | Train Device=CSX, Step=200, Loss=8.12500, Rate=43.67 samples/sec, GlobalRate=43.67 samples/sec
2023-11-29 21:08:28,781 INFO:   Saving checkpoint at step 200
2023-11-29 21:13:56,695 INFO:   Saved checkpoint model_dir_gptj/checkpoint_200.mdl
2023-11-29 21:14:30,135 INFO:   Heartbeat thread stopped for wsjob-kd4olqkhu6ya8qqzt88utd.
2023-11-29 21:14:30,142 INFO:   Training completed successfully!
2023-11-29 21:14:30,142 INFO:   Processed 24000 sample(s) in 910.883781998 seconds.
  ```
</details>
