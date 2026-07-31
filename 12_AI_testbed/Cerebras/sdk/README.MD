# Getting Started with the Cerebras SDK

The following guide gives an overview of the Cerebras SDK, and installation instructions.

## Introduction

The WSE-3, the chip within the Cerebras CS-3, is a massive, nearly million-core wafer. While our
core mission is to serve the world's largest and fastest AI workloads, the ultra-high bandwidth
memory and fabric of the WSE suits many other applications in HPC and beyond, enabling orders of
magnitude speedup over more traditional hardware.

For example, developers and researchers have built seismic modeling applications and fluid dynamics
simulations at TotalEnergies and the National Energy Technology Laboratory, respectively. A
research team at Argonne implemented a key kernel in Monte Carlo particle transport simulations.
A 2023 Gordon Bell Finalist from KAUST used CS-2s for seismic imaging, and a 2024 Gordon Bell
Finalist used a CS-2 for molecular dynamics simulations of metallic systems.

To allow external developers to write their own custom kernels and support these use cases, the
Cerebras SDK allows users to build custom programs running at Wafer-Scale using the Cerebras
Software Language (CSL), a low-level language for programming individual PEs and the WSE fabric.

## SDK Overview

Users write two components to specify their programs: (1) device code in CSL, which runs on the CS
system, and (2) host code in Python, which uses Cerebras APIs to move data between and launch
functions on the CS system. CSL is a low-level kernel programming language for the CS system, in
which users both write the code running on individual Processing Elements (PE), and specify the
placement of programs and routing of data on the WSE. CSL provides libraries for several common
primitive operations, such as broadcasts, gathers, and scatters across rows or columns of PEs.

Because iterative development and debugging is crucial in the kernel writing process, Cerebras
provides a simulator workflow for compiling and running programs. This is provided via a
Singularity container, which users can run natively on any x86 computer, or an ARM/ Apple Silicon
computer via emulation. This workflow provides scripts for compiling device code (`cslc`) and
running the Python host code (`cs_python`) to drive a cycle-accurate simulation of the Wafer-Scale
Engine (WSE).

Because the simulation is cycle-accurate, a user typically does not simulate an entire WSE, but a
"subfabric," such as a 10x10 or 20x20 grid of PEs. For debugging, simulator logs are produced with
information on instruction traces and data flow. Users can additionally visualize their programs'
execution on the WSE with a GUI. 

## Installation and Setup

   > [!NOTE]  
   > The following instructions are for downloading and installing the SDK on Linux.
   > See [here](https://sdk.cerebras.net/installation-guide#apple-silicon-mac-installation)
   > for Apple Silicon instructions.
   > For the Argonne tutorial, the SDK is already installed at `/software/cerebras/cs_sdk-1.3.0`. Add this location
   > to your `PATH` with `export PATH=$PATH:/software/cerebras/cs_sdk-1.3.0`.

1. **Download the SDK**

   First, download the tarball containing the SDK singularity container and associated files by following instruciton here: [https://www.cerebras.ai/developers/sdk-request]()
   .   

2. **Setup Environment and Extract Files**
   Set the following environment variables, pointing to the location where you want to install the
   SDK, and where you downloaded the tarball.

   ```
   $ export SDK_INSTALL_PATH=/my/install/location/cs_sdk-1.3.0
   $ export SDK_TAR_PATH=/path/to/Cerebras-SDK-1.2.0-{build id}.tar.gz
   ```

   Now create the directory where you will install the Cerebras SDK, and extract the files from the
   downloaded tarball into that directory.

   ```
   $ mkdir -p $SDK_INSTALL_PATH
   $ tar -C $SDK_INSTALL_PATH -xvf $SDK_TAR_PATH
   ```

3. **Install the SDK**
   Add the SDK to your `PATH`. You can additionally consider adding the `PATH` update command to
   your `.bashrc`.

   ```
   $ PATH_CMD='export PATH='$SDK_INSTALL_PATH':$PATH'
   $ eval $PATH_CMD
   ```

   You can additionally consider adding the `PATH` update command to your `.bashrc`.

   ```
   $ echo $PATH_CMD >> ~/.bashrc
   ```

## Next Steps

For convenience, this repository contains two example programs for running the SDK simulator:
- [Single-PE GEMV](single-pe-gemv/README.MD) performs a matrix-vector computation on a single PE,
- and [Two-PE GEMV](two-pe-gemv/README.MD) distributes this computation between two PEs.

These and more example programs can be found on ALCF at
`/software/cerebras/cs_sdk-1.3.0/csl-extras-202406260214-4-70afe120/examples`.
Copy these to your home directory to run them.

## More Information

For more information, visit our
[Cerebras SDK documentation](https://sdk.cerebras.net/).

See more example programs in our [examples GitHub repo](https://github.com/Cerebras/csl-examples).
