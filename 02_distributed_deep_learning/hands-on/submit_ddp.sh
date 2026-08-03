#!/bin/bash -l

module load frameworks
export CPU_BIND="verbose,list:4-7:8-11:12-15:16-19:20-23:24-27:56-59:60-63:64-67:68-71:72-75:76-79" 
mpiexec -np 12 -ppn 12 --cpu-bind=${CPU_BIND} python ddp_example.py
