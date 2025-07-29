# GPT 1.5B Parameter on Sambanova

##### Create and and move to the following directory.

```bash
mkdir -p ~/apps/nlp/Gpt1.5B_single
cd ~/apps/nlp/Gpt1.5B_single
```

##### Copy script to Compile and Run

```bash
cp /data/ANL/scripts/Gpt1.5B_base_single_compile.sh .
cp /data/ANL/scripts/Gpt1.5B_base_single_run.sh .

chmod +x Gpt1.5B_base_single_compile.sh
chmod +x Gpt1.5B_base_single_run.sh
```

##### Run the script to Compile and Run

```bash
./Gpt1.5B_base_single_compile.sh 32
```
For more information refer to [Gpt1.5B](https://docs.alcf.anl.gov/ai-testbed/sambanova/example-programs/#gpt-15b). 

Precompiled artifacts are available at : /data/scratch/preCompiled/ directory that can be accessed by any compute node. 
Change the OUTDIR path as below in the above scripts
```bash
OUTDIR=/data/scratch/preCompiled/${MODEL_NAME}
```
