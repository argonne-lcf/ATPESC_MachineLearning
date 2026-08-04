#!/bin/bash
echo "Status of ALCF resources:"
curl -X GET "https://api.alcf.anl.gov/api/v1/status/resources" | jq
echo "Status of Polaris:"
curl -X GET "https://api.alcf.anl.gov/api/v1/status/resources/55c1c993-1124-47f9-b823-514ba3849a9a" | jq

