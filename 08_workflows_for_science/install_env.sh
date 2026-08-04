#!/bin/bash -l

# This script installs the environment for Aurora
module load frameworks
python -m venv _env --system-site-packages # including the --system-site-packages flag will inherit packages from frameworks
pip install -r requirements
dragon-config add --ofi-runtime-lib=/opt/cray/libfabric/1.22.0/lib64
