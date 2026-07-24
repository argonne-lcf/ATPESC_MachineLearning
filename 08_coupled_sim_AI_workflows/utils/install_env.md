# Instructions for Installing the Environment for the 2026 ATPESC Sim+AI Examples 

## ALCF Aurora

1. Load the AI/ML module to get access to conda
    ```bash
    module load frameworks
    ```

2. Create a new conda env (can't install xtb-python via pip, so can't use a Python venv)
    ```bash
    conda create -y --prefix /path/to/_atpesc_simAI python=3.12.12 pip
    conda activate /path/to/_atpesc_simAI
    ```

3. Install the packages related to chemistry problem
    ```bash
    pip install ase rdkit pandas scikit-learn tqdm imgcat
    conda install -y -c conda-forge xtb-python
    ```

3. Install PyTorch
   ```bash
   pip install torch==2.10.0 torchvision==0.25.0 torchaudio==2.10.0 --index-url https://download.pytorch.org/whl/xpu
   pip install safetensors transformers
   ```

3. Install Parsl
    ```bash
    pip install parsl
    ```

5. Install DragonHPC
    ```bash
    pip install dragonhpc
    dragon-config add --ofi-runtime-lib=/opt/cray/libfabric/1.22.0/lib64
    ```

6. Install the `chemfunctions` package which comes with the example repository
    ```bash
    git clone https://github.com/argonne-lcf/ai-science-training-series.git
    cd ai-science-training-series/03-Coupling-Sim-AI/ml-in-the-loop/chemfunctions
    pip install -e .
    ```

7. Export important environment variables
   ```bash
   export TMPDIR=/tmp
   ```

8. Pack conda env for use on /tmp (optional)
    ```bash
    conda-pack --prefix /flare/ATPESC2026/usr/balin/_atpesc_simAI/ --output /flare/ATPESC2026/usr/balin/_atpesc_simAI.tar.gz
    ```
