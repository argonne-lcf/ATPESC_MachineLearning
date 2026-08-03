# Introduction to AI Testbed at ALCF and Hands-On

[ALCF AI Testbed](https://docs.alcf.anl.gov/ai-testbed/) hosts several novel dataflow accelerators for AI training and inference. 
It aims to help evaluate the usability and performance of machine learning-based high-performance computing applications running on these accelerators. Currently there are 4 Cerebras CS-3 Wafer scale engines (WSE), 6 nodes of SambaNova SN40L (Metis cluster) with 32 SN40L Reconfigurable Dataflow Units (RDUs) each, 2 Tenstorrent Galaxy servers with 32 Wormhole chips each, 4 Graphcore BowPod-16s, a GroqRack with 72 Groq Chips.

In this tutorial, we will focus on Cerebras (AI training and low-level programming with CSL SDK), SambaNova (with ALCF Inference Service) and Tenstorrent (inference).

* [Cerebras](./Cerebras/README.md)
* [Sambanova](./SambaNova/README.md)
* [Tenstorrent](./Tenstorrent/README.md)

Additional details on ALCF AI Testbed is available at [online documentation](https://docs.alcf.anl.gov/ai-testbed/).



> This work used resources of the Argonne Leadership Computing Facility, which is a DOE Office of Science User Facility supported under Contract DE-AC02-06CH11357.
