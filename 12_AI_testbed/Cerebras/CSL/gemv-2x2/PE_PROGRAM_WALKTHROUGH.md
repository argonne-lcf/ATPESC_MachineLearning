# `pe_program.csl` — A Line-by-Line Walkthrough for C Programmers

This is the **per-PE program** for the **2×2 GEMV** hands-on. The *same* source
compiles onto **all four PEs** in a 2×2 grid, and each copy figures out its
own role at runtime from its coordinates. Together they compute

```
y = A·x + b      A is 4×6,  x = ones(6),  b = twos(4)
```

with `A` split into quadrants: NW→PE(0,0), NE→PE(1,0), SW→PE(0,1), SE→PE(1,1).

The single most important mental shift from C: **there is no `main()` that runs
top to bottom.** A PE sits idle until a *wavelet* (a 32-bit word travelling on
the fabric) or a host command arrives. Arrival of data *is* the function call.
This is called the **wavelet-triggered execution model**, and the whole file is
organized around it. Keep that in mind as we go.

---

## 1. Parameters — values baked in at compile time

```csl
param memcpy_params;

// Matrix dimensions
param M_per_PE: i16;
param N_per_PE: i16;
```

`param` is a **compile-time constant supplied from outside** (here, from
`layout.csl` via `@set_tile_code`). Think of it as a `#define` that the layout
file fills in, except it is type-checked. Because these are known at compile
time, the compiler can size arrays and unroll loops with them.

- `memcpy_params` is an opaque bundle of configuration the host↔device copy
  infrastructure needs. We just pass it straight into the memcpy module.
- `M_per_PE` / `N_per_PE` are this PE's slice of the matrix: with a 4×6 matrix
  on a 2×2 grid, each PE holds a `2×3` quadrant, so `M_per_PE = 2`,
  `N_per_PE = 3`.

```csl
// Colors
param ax_color: color; // sends partial result Ax EAST
param x_color:  color; // sends elems x SOUTH/ recvs elems x from NORTH
```

A **`color`** is CSL's name for a *virtual routing channel* on the fabric —
like a hardware "topic" that wavelets are tagged with. The router on each PE is
configured (in `layout.csl`) to forward a given color in specific directions.
Two colors are used here:

- `x_color` — carries elements of `x`, routed **SOUTH** down each column.
- `ax_color` — carries partial `y` results, routed **EAST** across each row.

The *routing* (which direction) lives in `layout.csl`; this file only cares
*which color* to send/receive on.

---

## 2. Queues — the hardware endpoints behind a color

```csl
// Queue IDs
const ax_color_oq: output_queue = @get_output_queue(2);
const ax_color_iq: input_queue  = @get_input_queue(2);
const x_color_oq:  output_queue = @get_output_queue(3);
const x_color_iq:  input_queue  = @get_input_queue(3);
```

A color says *what channel*; a **queue** is the concrete hardware resource used
to actually push data onto the fabric (`output_queue`) or pull it off
(`input_queue`). `@get_output_queue(2)` / `@get_input_queue(2)` grab
queue **number 2** and so on — these small integers are physical queue indices,
so different colors should use different numbers to avoid collisions.

Why does WSE-3 need these when older code did not? On **WSE-3**, sends and
receives must be explicitly bound to a queue; on **WSE-2** the color alone was
enough. This file declares the queues up front so the rest of the code can work
on both architectures (you'll see `@is_arch` branches below choosing between
them).

---

## 3. Task IDs — handles for the code that runs on an event

```csl
// Task ID used by exit task to unblock cmd stream
const exit_task_id:   local_task_id = @get_local_task_id(9);

// Task ID used by reduce task
const reduce_task_id: local_task_id = @get_local_task_id(10);
```

A **task** is a function that runs in response to an event, and a
**`local_task_id`** is a small integer handle you use to *trigger* that task
from your own code (as opposed to being triggered by an incoming wavelet). Here:

- `exit_task_id` (id 9) will run `exit_task` to tell the host "I'm done."
- `reduce_task_id` (id 10) will run `reduce`, the east-bound reduction.

`@get_local_task_id(N)` reserves task-slot `N`. These are activated later with
`@activate(...)` or via the `.activate = ...` field on an async operation.

```csl
// Data task ID for task recv_x, consumes x_color wlts
// On WSE-2, data task IDs are created from colors; on WSE-3, from input queues
const recv_x_task_id: data_task_id =
  if      (@is_arch("wse2")) @get_data_task_id(x_color)
  else if (@is_arch("wse3")) @get_data_task_id(x_color_iq);
```

A **`data_task_id`** is different from a `local_task_id`: it is the handle for a
task triggered by **incoming wavelets on a color**, and the wavelet's payload is
passed *as an argument*. This is the wavelet-triggered task (WTT) mechanism.

The `@is_arch(...)` branch is the key portability idiom in this file:

- **WSE-2**: the data task is keyed off the **color** directly
  (`@get_data_task_id(x_color)`).
- **WSE-3**: it is keyed off the **input queue** the color feeds into
  (`@get_data_task_id(x_color_iq)`).

Because `@is_arch` is evaluated at compile time, only the correct branch is
actually compiled for the target machine — this is a compile-time `if`, not a
runtime one.

---

## 4. Module imports — infrastructure and coordinates

```csl
// memcpy module provides infrastructure for copying data
// and launching functions from the host
const sys_mod = @import_module("<memcpy/memcpy>", memcpy_params);

// layout module provides PE coordinates at runtime
const layout_mod = @import_module("<layout>");
```

`@import_module` is CSL's `#include`-meets-instantiation: it pulls in a module
and, for parameterized modules, configures it in one step.

- `sys_mod` (the **memcpy** module) is the plumbing that lets the **host**
  (`run.py`) copy arrays into/out of device memory and `launch()` exported
  functions. `unblock_cmd_stream()` (used later) lives here.
- `layout_mod` (the **`<layout>`** module) answers "**where am I?**" at
  runtime: `get_x_coord()` and `get_y_coord()` return this PE's column and row.
  This is what lets one program behave differently per PE **without** compiling
  a distinct binary per PE — a deliberate design choice noted in the README to
  cut compile time.

---

## 5. Global memory — the PE's local arrays

```csl
// 48 kB of global memory contain A, x, b, y
var A: [M_per_PE*N_per_PE]f32; // A is stored column major
var x: [N_per_PE]f32;
var y: [M_per_PE]f32;
```

These are ordinary statically-sized arrays in this PE's 48 kB of local SRAM
(`var` = mutable, sized by the `param`s from step 1). Each PE holds only *its
own quadrant* of `A` (a `2×3` block, stored **column-major** — important for the
matvec below), its slice of `x`, and its slice of the output `y`. Note `b` isn't
a separate array: the host pre-loads `b` directly into `y` on the left column,
so the computation naturally accumulates on top of it.

---

## 6. DSDs — descriptors that let hardware sweep an array

```csl
// A_dsd accesses column of A
var A_dsd = @get_dsd(mem1d_dsd, .{ .base_address = &A, .extent = M_per_PE });
var x_dsd = @get_dsd(mem1d_dsd, .{ .base_address = &x, .extent = N_per_PE });
var y_dsd = @get_dsd(mem1d_dsd, .{ .base_address = &y, .extent = M_per_PE });
```

A **DSD** (Data Structure Descriptor) is the single most CSL-specific concept
here. In C you'd write a loop with an index; in CSL you instead hand the
hardware a **descriptor** — base address + extent (+ stride, offsets, etc.) —
and a single builtin like `@fmacs` sweeps the whole range for you. Think of it
as `{pointer, length}` that the vector engine iterates over natively.

- `mem1d_dsd` = a 1-D window into **memory**.
- `A_dsd` describes **one column** of `A`: it starts at `&A` and spans
  `M_per_PE` (=2) elements. Because `A` is column-major, these two elements are
  the first column `A[:,0]`. We'll slide this window one column at a time.
- `x_dsd`, `y_dsd` describe the full `x` (3 elems) and `y` (2 elems) vectors.

---

## 7. Role helpers — who am I in the grid?

```csl
fn is_top_row() bool {
  return (layout_mod.get_y_coord() == 0);
}

fn is_left_col() bool {
  return (layout_mod.get_x_coord() == 0);
}
```

Plain functions that turn coordinates into roles. Row 0 is the **top row** (the
PEs that own `x` and kick off the broadcast); column 0 is the **left column**
(the PEs that own `b`/`y` and must send their partial result east). Everything
downstream branches on these two predicates.

---

## 8. `reduce` — the eastbound reduction task

```csl
task reduce() void {
  if (is_left_col()) {
    const out_dsd = @get_dsd(fabout_dsd, if (@is_arch("wse3")) .{
                      .extent = M_per_PE, .output_queue = ax_color_oq
                    } else .{
                      .fabric_color = ax_color, .extent = M_per_PE,
                      .output_queue = ax_color_oq
                    });
    // After fmovs is done, activate exit_task to unblock cmd stream
    @fmovs(out_dsd, y_dsd, .{ .async = true, .activate = exit_task_id });

  } else {
    const in_dsd = @get_dsd(fabin_dsd, .{
                     .extent = M_per_PE,
                     .input_queue  = ax_color_iq
                   });
    // After fadds is done, activate exit_task to unblock cmd stream
    @fadds(y_dsd, y_dsd, in_dsd, .{ .async = true, .activate = exit_task_id });
  }
}
```

This one task does opposite things depending on the column — same code, two
roles:

- A **`fabout_dsd`** is a DSD whose "array" is the **outgoing fabric**: writing
  to it *sends wavelets*. A **`fabin_dsd`** is the mirror image — reading from it
  *pulls wavelets off the fabric*. This is the beautiful part of DSDs: sending
  over the network looks exactly like a memory operation, just with a different
  descriptor.

- **Left column** builds `out_dsd` on `ax_color` and runs
  `@fmovs(out_dsd, y_dsd, ...)` — a "float move" that copies each element of the
  in-memory `y_dsd` **out onto the fabric**, eastward. Note the WSE-3 vs WSE-2
  split again: WSE-3 identifies the stream by `output_queue`, WSE-2 also needs
  `.fabric_color`.

- **Right column** builds `in_dsd` reading from `ax_color_iq` and runs
  `@fadds(y_dsd, y_dsd, in_dsd, ...)` — "float add": `y = y + (incoming
  wavelets)`. So the right PE adds the left PE's partial `y` onto its own. That
  is the reduction.

- `.async = true` means the operation runs in the background on the fabric while
  the task returns; `.activate = exit_task_id` says "when this async op
  finishes, fire `exit_task`." This is how you chain work in an event-driven
  model: completion of one op *activates* the next.

With the verified numbers: left PE(0,0) sends `[5,23]` east, right PE(1,0) adds
it to its own `[12,30]` → `[17,53]`. Likewise PE(0,1)`[41,59]` + PE(1,1)`[48,66]`
→ `[89,125]`.

---

## 9. `recv_x` — the wavelet-triggered matvec, and the completion counter

```csl
// Use to keep track of # of invocations of recv_x task
// when num_recv_x == N_per_PE, we are done receiving x elements
var num_recv_x: i16 = 0;

task recv_x(x_val: f32) void {
  @fmacs(y_dsd, y_dsd, A_dsd, x_val);
  A_dsd = @increment_dsd_offset(A_dsd, M_per_PE, f32);

  num_recv_x += 1;
  if (num_recv_x == N_per_PE) {
    @activate(reduce_task_id);
  }
}
```

This is the heart of the program. `recv_x` is a **data task**: it fires **once
per wavelet** arriving on `x_color`, and the wavelet's 32-bit payload is handed
in as the argument `x_val`. There is no loop over `x` in this file — the *fabric*
delivers the elements one at a time and each delivery is a function call.

- `@fmacs(y_dsd, y_dsd, A_dsd, x_val)` is a **fused multiply-add across a DSD**:
  `y = y + A_col * x_val`, i.e. it adds `x_val` times the *current column of A*
  into `y`, sweeping all `M_per_PE` rows in one instruction. This is exactly the
  rank-1 update `y += A[:,j]·x[j]` of a matrix-vector product.

- `A_dsd = @increment_dsd_offset(A_dsd, M_per_PE, f32)` slides the column window
  forward by `M_per_PE` `f32`s — i.e. advances `A_dsd` from column `j` to column
  `j+1`, ready for the next wavelet. (Column-major storage is why "next column"
  is just "+M elements.")

- `num_recv_x` counts arrivals. Once it hits `N_per_PE` (=3), this PE has
  consumed all of its `x` elements and its partial `y` is complete, so it
  `@activate(reduce_task_id)` to launch the reduction. This counter is the
  event-driven equivalent of a loop's exit condition.

After all three arrivals: PE(0,0)=`[5,23]`, PE(1,0)=`[12,30]`,
PE(0,1)=`[41,59]`, PE(1,1)=`[48,66]` (the `b`=2 seed shows up in the left
column's totals).

---

## 10. `compute` — the host entry point that kicks everything off

```csl
// The top row sends x values along x_color to launch recv_x
fn compute() void {
  if (is_top_row()) {
    const send_x_dsd = @get_dsd(fabout_dsd, if (@is_arch("wse3")) .{
                         .extent = N_per_PE, .output_queue = x_color_oq
                       } else .{
                         .fabric_color = x_color, .extent = N_per_PE,
                         .output_queue = x_color_oq
                       });
    @fmovs(send_x_dsd, x_dsd, .{ .async = true });
  }
}
```

`compute` is the function the **host** calls with `runner.launch('compute')`.
It runs on all four PEs, but only the **top row** does anything: it builds a
`fabout_dsd` on `x_color` and `@fmovs` its in-memory `x` (`x_dsd`) **onto the
fabric**, southbound. That's the broadcast that feeds every PE's `recv_x`.

### The RAMP-loopback insight (do not skip this)

Here is the subtlety that trips everyone up. `recv_x` is triggered by a
**wavelet arriving**, *not* by `x` already sitting in the top-row PE's memory.
So how does a top-row PE ever run `recv_x` for its own `x`?

Look at the router config in `layout.csl` for the top row:

```csl
@set_color_config(0, 0, x_color, .{.routes = .{ .rx = .{RAMP}, .tx = .{RAMP, SOUTH} }});
```

The transmit route is `.{RAMP, SOUTH}`. **SOUTH** sends the wavelet down to the
PE below; **RAMP** loops the very same wavelet **back down into the sending PE's
own compute core**. "RAMP" is the on-/off-ramp between a PE's router and its
core. So when the top PE pushes `x` out, each element goes *both* to its
southern neighbor *and* back to itself — and it is that looped-back arrival that
fires the top PE's own `recv_x`. Without the RAMP branch, the top row would send
its `x` but never compute with it. The bottom row, by contrast, receives from
`.rx = .{NORTH}` and ramps in.

---

## 11. `exit_task` — telling the host we're finished

```csl
task exit_task() void {
  sys_mod.unblock_cmd_stream();
}
```

Recall that both branches of `reduce` set `.activate = exit_task_id`, so once a
PE's fabric op completes, this runs. `unblock_cmd_stream()` releases the host's
command stream so the next queued host command (the D2H copy of `y`) can proceed.
In an async, event-driven world this is how the device signals the host "my part
of `launch('compute')` is done" — the moral equivalent of returning from a
blocking call.

---

## 12. `comptime` — wiring events to code, once, at compile time

```csl
comptime {
  // When exit_task_id is activated, exit_task will execute
  @bind_local_task(exit_task, exit_task_id);

  // reduce is local task activated by ID reduce_task_ID
  @bind_local_task(reduce, reduce_task_id);

  // recv_x is wavelet-triggered task (WTT) activated by receiving
  // wavelets along color x_color, which corresponds to recv_x_task_id
  // On WSE-3, these wavelets are received in input queue x_color_iq
  @bind_data_task(recv_x, recv_x_task_id);
```

A **`comptime` block** runs entirely at compile time (like C++ `constexpr` /
static initialization). It doesn't compute results — it **configures the PE**:
it establishes which code runs on which event. Nothing here executes at runtime.

- `@bind_local_task(fn, id)` connects a function to a `local_task_id`, so that
  `@activate(id)` (or `.activate = id`) runs it. Both `exit_task` and `reduce`
  are wired this way.
- `@bind_data_task(recv_x, recv_x_task_id)` connects `recv_x` to the wavelet
  stream, so an arriving `x_color` wavelet *calls* `recv_x` with its payload.
  This is the binding that makes "data arrival = function call" real.

```csl
  @initialize_queue(ax_color_oq, if (@is_arch("wse3")) .{ .color = ax_color } else .{});
  @initialize_queue(ax_color_iq, .{ .color = ax_color });
  @initialize_queue(x_color_oq,  if (@is_arch("wse3")) .{ .color = x_color } else .{});
  @initialize_queue(x_color_iq,  .{ .color = x_color });
```

`@initialize_queue` binds each hardware queue (from step 2) to its color. On
**WSE-3** the *output* queues must be told their color explicitly (`.{ .color =
... }`); on **WSE-2** an empty config `.{}` suffices because the color is carried
another way. Input queues bind to their color on both architectures. This is the
last piece of the color↔queue association the WSE-3 send/receive path needs.

```csl
  @export_symbol(A_ptr, "A");
  @export_symbol(x_ptr, "x");
  @export_symbol(y_ptr, "y");
  @export_symbol(compute);
}
```

`@export_symbol` publishes names to the **host**. The three array pointers
(declared earlier as `var A_ptr: [*]f32 = &A;` etc.) let `run.py` do
`runner.get_id('A')` and then `memcpy_h2d`/`memcpy_d2h` into device memory;
exporting `compute` lets the host `runner.launch('compute')`. These exports are
the entire host↔device API surface of the program. On the layout side,
`layout.csl` mirrors them with `@export_name`.

---

## The whole story in one paragraph

The host copies each PE its quadrant of `A`, seeds `b` into `y` on the left
column, and hands `x` to the top row. `launch('compute')` makes the top row
`@fmovs` its `x` onto `x_color`, routed SOUTH **and** looped back via RAMP so
every PE — including the senders — receives each `x` element as a wavelet. Each
wavelet fires `recv_x`, which does one `@fmacs` column-update of `y` and slides
`A_dsd` to the next column; after `N_per_PE` arrivals the PE `@activate`s
`reduce`. The left column `@fmovs` its partial `y` EAST on `ax_color`; the right
column `@fadds` it in, completing `y`. Each completion fires `exit_task` →
`unblock_cmd_stream`, and the host copies the final `y` (`[17,53,89,125]`) back
from the right column. Not a single explicit outer loop anywhere — the fabric's
delivery of data *is* the control flow.
