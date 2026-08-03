# [ATPESC 2026](https://extremecomputingtraining.anl.gov/)

## [Agenda](https://extremecomputingtraining.anl.gov/2026-agenda)

### Monday, August 3

Time    | Talk                                                                                          | Speaker
|--     |--                                                                                             |--
8:30AM	|  Welcome and Introduction	                                                                    | Shilpika, ANL
8:35AM	|  Transition time: splitting into groups (people new to deep learning vs. more experienced)    |  	 	 	 
8:35AM	|  Parallel Session                                                    | 
|       |    - Main room: [Introduction to Deep Learning](01_intro_to_deep_learning)              | Huihuo Zheng, ANL
|       |    - Breakout room: [Distributed Deep Learning](02_distributed_deep_learning)          | Bethany Lusch, ANL
9:50AM | *Break*
10:15AM	|  [Profiling Deep Learning](03_advanced_profiling_deep_learning) | Nathan Nichols, ANL
11:20 AM | [Introduction to Large Language Models (LLMs)](04_intro_to_LLMs)	                            | Jingyan (Jane) Jiang, ANL
12:00PM | [Pre-training on a Supercomputer - Part 1](05_pretraining_on_supercomputer) | Sam Foreman, ANL
12:30PM	| *Lunch* |
1:30PM	|  [Pre-training on a Supercomputer - Part 2](05_pretraining_on_supercomputer) | Sam Foreman, ANL
2:30PM	|  [Post-training (Finetuning/Alignment/RL  techniques)](06_post_training) | Filippo Simini, ANL
4:00PM | [Explainable AI for Science](07_explainable_AI) | Shilpika, ANL
4:30PM | *Break* |
5:30PM | Featured Speaker | Jack Dongarra

### Tuesday, August 4
Time    | Talk                                                                                          | Speaker
|--     |--                                                                                             |--
8:30AM | Welcome and introduction | Shilpika, ANL
8:35AM | [Workflows for Science - Parsl, Balsam, etc.](08_worflow_for_science) | Christine Simpson, ANL
9:30AM | [Coupled Workflows for Science (Simulations + AI Workflows)](09_workflows_coupling_simulation_and_AI) | Riccardo Balin and Christine Simpson, ANL
10:30AM | *Break* |
10:50AM | [Inference](10_LLM_inference) | Misha Salim, ANL
11:50 AM | [Agentic Tools - Part 1 (Trinity/Hermes/OpenClaw)](11_Agentic_tools_part1) | Huihuo Zheng, ANL
12:30 PM | *Lunch* |
1:30 PM | [AI Testbed](12_AI_testbed)                                                  | Varuni Sastry and Murali Emani, ANL
3:00PM	|  [Agentic Workflows for Science](13_agentic_workflows_for_science) | Thang Pham, ANL
4:00PM | [Agentic Tools - Part 2 (Academy)](14_agentic_tools_part2) | Kyle Chard, UChicago/ANL
4:30PM	|  *Break*  |
5:30PM | Featured Speaker| Bill Gropp



At the beginning of the first day, we will temporarily split into two groups. Attendees can choose between [Introduction to Deep Learning](01_intro_to_deep_learning) and [Distributed Deep Learning](02_distributed_deep_learning).  

The "Introduction to deep learning" session will rely on Jupyter Notebooks which are targeted for running on [Google's Colaboratory Platform](https://colab.research.google.com) or [ALCF JupyterHub](https://jupyter.alcf.anl.gov/). The Colab platform gives the user a virtual machine in which to run Python codes including machine learning codes. The VM comes with a preinstalled environment that includes most of what is needed for these tutorials.

The other sessions involve Python scripts executed on the [Aurora](https://docs.alcf.anl.gov/aurora/getting-started-on-aurora/) and [AI Testbed](https://docs.alcf.anl.gov/ai-testbed/) platforms at ALCF.                                                             


## Reservations

- **Queue**:
    - **Daytime reservations**: -q ATPESC
    - **Evening reservations**: -q ATPESC-Night
    - **Outside of reservations**: -q debug or -q prod ([more info](https://docs.alcf.anl.gov/aurora/running-jobs-aurora/)) 
- **Project/Allocation**: ATPESC2026 (`-A ATPESC2026`)
- Shared **directories**:
    - Aurora: `/flare/ATPESC2026`
    - Polaris: `/eagle/ATPESC2026`
- **ALCF Unix Groups**: ATPESC2026

## Using Google Colab

Google Colab involves running Jupyter notebooks. 

Do the following before you come to the tutorial:
*  You need a Google Account to use Colaboratory
*  Go to [Google's Colaboratory Platform](https://colab.research.google.com) 
*  You should see this page
![start_page](README_imgs/colab_start_page.png)
*  Now you can open the `File` menu at the top left and select `Open Notebook` which will open a dialogue box.
*  Select the `GitHub` tab in the dialogue box.
*  From here you can enter the url for the github repo: `https://github.com/argonne-lcf/ATPESC_MachineLearning` and hit `<enter>`.
![open_github](README_imgs/colab_open_github.png)
*  This will show you a list of the Notebooks available in the repo. When you select a notebook from this list it will create a copy for you in your Colaboratory account (all `*.ipynb` files in the Colaboratory account will be stored in your Google Drive).
* To use a GPU in the notbook select `Runtime` -> `Change Runtime Type` and select an accelerator.



## Weights & Biases API key

For the [Pre-training on a Supercomputer](05_pretraining_on_supercomputer) session, you will need a Wandb api_key. 
Visit <https://docs.wandb.ai/quickstart/> to sign-up and get the key.
