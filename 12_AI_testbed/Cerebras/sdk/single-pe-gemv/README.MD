# Single-PE GEMV

*See [Cerebras SDK tutorials 0 through 6](https://sdk.cerebras.net/csl/tutorials/)
for an in-depth look at these examples.*

This example demonstrates a complete CSL program.

A complete program consists of a host program (a Python script, in this example)
and at least two CSL code files, one of which defines the layout of the program
across a collection of processing elements (PEs) on the Wafer-Scale Engine
(hereafter referred to as "device"), and one or more of which define the
programs running on the individual PEs. In this example, there is just one PE.

When executing the program, the user first compiles the CSL code files, and
then invokes the host program to copy data on and off the device and launch
functions on the device using a remote procedure call (RPC) mechanism. The
device used may be an actual CS system, or it may be simulated without access
to an actual CS system using the Cerebras Fabric Simulator.

The host program here is defined in the `run.py` script, and the layout and
device code are defined in `layout.csl` and `pe_program.csl`.

The movement of data from host to device and back is done with memory to memory
copy semantics, which is provided by an SDK utility called `memcpy`. The top
of the `layout.csl` file imports a module which is used to parameterize the
program's `memcpy` infrastructure. This file also includes a layout block
which specifies the number and spatial arrangement of PEs used by this program,
as well as the instructions to execute on each PE. Here, we instruct the
compiler to produce executable code for 1 PE using the code in
`pe_program.csl`.

This program executes as follows. The host code `run.py` first initializes a
4 x 6 matrix `A`, stored in row-major format, a 6 x 1 vector `x`, and a
4 x 1 vector `b`. The host code performs a host-to-device memcpy with the
`memcpy_h2d` command to copy `A`, `x`, and `b` to the device, and then
 uses the remote procedure call (RPC) mechanism to launch a function called
`compute_gemv` on the device. This function computes the matrix-vector
product `Ax + b` and stores the result in `y`.

To perform the matrix-vector product, the program uses memory Data Structure
Descriptors (DSDs), an efficient mechanism for performing operations on entire
tensors. This program creates three one-dimensional memory DSDs for accessing
`A`, `b`, and `y`, each of which specifies how to loop over the respective
arrays. The `tensor_access` field specifies an induction variable, a loop
bound, and an affine expression (i.e., a linear function plus a constant) to
generate various addresses at runtime.

`b_dsd` and `y_dsd` access the `M` contiguous elements of `b` and `y`,
respectively. `A_dsd` accesses `M` elements of `A`, but strided by `N`
elements. Because `A` is stored in row major format, this means that `A_dsd`
initially accesses the 0th column of `A`.

These DSDs are used by the DSD operations `@fmacs` and `@fadds` to compute
`Ax + b` and store it in `y`. The `gemv` function first loops over `N`,
with the `@fmacs` in iteration `i` computing the scalar-vector product of
`x[i]` with column `i` of `A`, and incrementing `y` by that result.
The `increment_dsd_offset` operation updates `A_dsd` by shifting its access
by one element. This causes `A_dsd` to access the next column of `A`. After
the loop, `y` is incremented by `b` with the `@fadds` operation, to
complete the computation.

Once `compute_gemv` finishes on the device, the host program performs a
device-to-host memcpy with the `memcpy_d2h` command to copy back the result
stored in `y`, and then checks that the answer is correct. Notice the
`ublock_cmd_stream` call in `pe_program.csl` that occurs at the end of
`compute_gemv`; this call allows the device-to-host `memcpy_d2h` to proceed.
