#!/usr/bin/env bash
#
# Get an ALCF inference access token via Globus and export it for this shell.
#
# ALCF inference endpoints authenticate with a Globus-issued access token.
# See: https://docs.alcf.anl.gov/services/inference-endpoints/#web-ui
#
# The bundled scripts/inference_auth_token.py wraps the official Globus flow:
#   * `authenticate`     -> one-time interactive login (opens a browser / device flow)
#   * `get_access_token` -> prints a valid token, auto-refreshing if it expired
#
# The tutorial code (atpesc_agentic.alcf_llm.build_alcf_llm) will call
# get_access_token() for you automatically, so exporting the token is OPTIONAL.
# Run this only if you want the token in your environment for other tools, or to
# force the login step ahead of time.
#
# Usage:
#   source scripts/get_alcf_token.sh     # note: `source`, so the export persists
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AUTH="${SCRIPT_DIR}/inference_auth_token.py"

# Tokens are cached under ~/.globus/app/... after the first login. Authenticate
# only if no valid token can be produced yet.
if ! python "${AUTH}" get_access_token >/dev/null 2>&1; then
    echo "No cached ALCF token found — starting Globus login..." >&2
    python "${AUTH}" authenticate
fi

ALCF_ACCESS_TOKEN="$(python "${AUTH}" get_access_token)"
export ALCF_ACCESS_TOKEN
echo $ALCF_ACCESS_TOKEN
echo "ALCF_ACCESS_TOKEN exported (expires in \
$(python "${AUTH}" get_time_until_token_expiration --units minutes) minutes)." >&2
