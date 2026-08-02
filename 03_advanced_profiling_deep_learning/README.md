# Intro to Tracing AI/ML Models with THAPI

Materials for Nathan Nichols's ATPESC 2026 presentation in Track 6 — AI/ML,
given on Monday, August 3, 2026, at 10:15 a.m.

The session introduces ways to preserve useful AI/ML context in a trace:

- specialization-aware names for Triton kernels;
- semantic application regions with Intel ITT; and
- correlation of model phases with device activity using THAPI/iprof and
  Perfetto.

## Presentation materials

- [Slides (PDF)](intro-to-tracing-ai-ml-models-with-thapi-atpesc-2026.pdf)
- [Interactive presentation](https://nscottnichols.github.io/intro-to-tracing-ai-ml-models-with-thapi-slides/)
- [Complete source and demos](https://github.com/nscottnichols/intro-to-tracing-ai-ml-models-with-thapi-slides)
- [Hands-on guide](https://github.com/nscottnichols/intro-to-tracing-ai-ml-models-with-thapi-slides/blob/main/HANDS_ON.md)

## Try the materials

Clone the complete presentation repository and run its checks:

```bash
git clone https://github.com/nscottnichols/intro-to-tracing-ai-ml-models-with-thapi-slides.git
cd intro-to-tracing-ai-ml-models-with-thapi-slides
python3 check_materials.py
```

Serve the interactive deck over HTTP so its Perfetto trace can autoload:

```bash
python3 -m http.server 8000 --directory .
```

Then open <http://localhost:8000/>. The included traces and source-reading
exercises need only Python and a browser. Live capture additionally requires a
configured PyTorch/Triton GPU environment, the Python `ittapi` binding, and
THAPI/iprof; see the hands-on guide for the full workflow.
