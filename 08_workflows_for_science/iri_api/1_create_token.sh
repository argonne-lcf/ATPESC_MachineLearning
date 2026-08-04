#!/bin/bash -l

# Retrieve and execute token script
# This will bring you to the Globus service to authenticate your ALCF credentials
wget https://raw.githubusercontent.com/argonne-lcf/alcf-facility-api-token/refs/heads/main/alcf_facility_api_globus_token.py
python alcf_facility_api_globus_token.py authenticate
