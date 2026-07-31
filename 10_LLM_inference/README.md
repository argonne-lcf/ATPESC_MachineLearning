# Optimized LLM Inference on Polaris

## Setup on Polaris 

* Get interactive node
  ```bash
  qsub -I -l select=1:ngpus=4 -l filesystems=home:eagle:grand -l walltime=1:00:00 -l -q ATPESC -A ATPESC2025
  ```

* Create a new virtual environemnt for vLLM
    ```bash
    $ module use /soft/modulefiles; 
    $ module load conda
    $ conda activate base

    $ conda create -n vllm python=3.11 -y
    ```
  
* Clone repo and activate module and install required dependancies 
  ```bash
  $ git clone https://github.com/argonne-lcf/ALCF_Hands_on_HPC_Workshop.git
  $ cd 05_LLM_inference

  $ module use /soft/modulefiles
  $ module load conda
  $ conda activate base

  $ pip install -r requirements.txt

  ```


## Hands-On Examples 

We will use LLAMA3-8B model to run inference hands-on examples. 

1. Inference with Huggingface
   ```bash
   $ python3 run_HF.py --model="meta-llama/Meta-Llama-3-8B"
   ```
   
   
2. Inference with vLLM
   ```bash
   $ python3 run_vllm.py --model="meta-llama/Meta-Llama-3-8B" \
                    --tensor-parallel-size=4 \
                    --output-len=64 \
                    --block-size=16 \
                    --dtype="float16"
   ```

<!-- 3. vLLM Quantization Example
   ```bash
   $ python3 run_vllm.py --model="neuralmagic/Meta-Llama-3-8B-Instruct-quantized.w8a8" \
                    --tensor-parallel-size=4 \
                    --output-len=64 \
                    --block-size=16
   ```

4. vLLM SD Example
   ```bash
   $ python3 run_vllm.py --model="meta-llama/Meta-Llama-3-8B" \
                    --speculative-model="turboderp/Qwama-0.5B-Instruct" \
                    --tensor-parallel-size=4 \
                    --speculative-draft-tensor-parallel-size=1 \
                    --num-speculative-tokens=5 \
                    --output-len=64 \
                    --block-size=16 \
                    --dtype="float16"
   ``` -->


## Useful Links 

+ [Link to Presentation Slides](./HPC%20Workshop%20Inference%20Optimizations.pdf) 
+ [ALCF Hands-on  HPC Workshop Agenda](https://www.alcf.anl.gov/events/2024-alcf-hands-hpc-workshop)
+ [vLLM Documentation](https://docs.vllm.ai/en/latest/)
+ [vLLM Repo](https://github.com/vllm-project/vllm)


##### Acknowledgements

Contributors: [Siddhisanket (Sid) Raskar](https://sraskar.github.io/) and [Krishna Teja Chitty-Venkata](https://krishnateja95.github.io/). 

> This research used resources of the Argonne Leadership Computing Facility, which is a DOE Office of Science User Facility supported under Contract DE-AC02-06CH11357.