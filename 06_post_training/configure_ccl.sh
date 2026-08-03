#!/bin/bash
# oneCCL, libfabric, and PALS tuning for ALCF Aurora/Sunspot.
# Sourced by launcher scripts before mpiexec.

# ── oneCCL tuning (ALCF recommended) ────────────────────────────────────────
export CCL_PROCESS_LAUNCHER=none
export CCL_ATL_TRANSPORT=mpi
export CCL_ATL_SYNC_COLL=1
export CCL_OP_SYNC=1
export CCL_KVS_MODE=mpi
export CCL_KVS_USE_MPI_RANKS=1
export CCL_KVS_CONNECTION_TIMEOUT=600
export MPI_PROVIDER=${FI_PROVIDER:-cxi}
export CCL_CONFIGURATION_PATH=""
export CCL_CONFIGURATION=cpu_gpu_dpcpp
unset MPIR_CVAR_CH4_POSIX_COLL_SELECTION_TUNING_JSON_FILE
unset MPIR_CVAR_CH4_COLL_SELECTION_TUNING_JSON_FILE
unset MPIR_CVAR_COLL_SELECTION_TUNING_JSON_FILE
export CCL_ALLREDUCE_SCALEOUT="direct:0-1048576;rabenseifner:1048577-max"
export CCL_BCAST=double_tree
export CCL_ZE_CACHE_OPEN_IPC_HANDLES_THRESHOLD=1024

# ── libfabric tuning ─────────────────────────────────────────────────────────
export FI_CXI_DEFAULT_CQ_SIZE=1048576
export FI_CXI_OFLOW_BUF_SIZE=8388608
export FI_CXI_CQ_FILL_PERCENT=30
export FI_CXI_RX_MATCH_MODE=hybrid
export FI_MR_ZE_CACHE_MONITOR_ENABLED=0
export FI_MR_CACHE_MONITOR=disabled
export PALS_PING_PERIOD=240
export PALS_RPC_TIMEOUT=240
