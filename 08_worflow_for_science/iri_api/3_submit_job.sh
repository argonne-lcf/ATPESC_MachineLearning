#!/bin/bash

# Exercise 1 should have retrieved script and created token
access_token=$(python alcf_facility_api_globus_token.py get_access_token)

# Polaris
resource_id="55c1c993-1124-47f9-b823-514ba3849a9a"

curl -X POST "https://api.alcf.anl.gov/api/v1/compute/job/${resource_id}" \
     -H "Authorization: Bearer ${access_token}" \
     -H "Content-Type: application/json" \
     -d '{
           "executable": "/bin/bash",
           "arguments": ["-lc", "echo Start; sleep 10; echo End"],
           "name": "my_job",
           "stdout_path": "$HOME/logs",
           "stderr_path": "$HOME/logs",
           "resources": {
               "node_count": 1
           },
           "attributes": {
               "duration": 300,
               "queue_name": "debug",
               "account": "ATPESC2026",
               "custom_attributes": {"filesystems": "home:eagle"}
           }
         }' | jq
