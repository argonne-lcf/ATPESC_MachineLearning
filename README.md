# [ATPESC 2026](https://extremecomputingtraining.anl.gov/atpesc-2026/)

## [Agenda](https://extremecomputingtraining.anl.gov/2026-agenda)

### Monday, August 3

Time    | Talk                                                                                          | Speaker
|--     |--                                                                                             |--
8:30AM	|  Welcome and Introduction	                                                                    | Shilpika, ANL
8:35AM	|  Transition time: splitting into groups (people new to deep learning vs. more experienced)    |  	 	 	 
8:35AM	|  Parallel Session                                                    | 
|       |    - Main room: [Introduction to Deep Learning](01novice_intro_to_deep_learning)              | Huihuo Zheng, ANL
|       |    - Breakout room: [Distributed Deep Learning](03_distributed_deep_learning)          | Bethany Lusch, ANL
9:50AM | *Break*
10:15AM	|  [Profiling Deep Learning](01advanced_profiling_deep_learning) | Nathan Nichols, ANL
11:20 AM | [Introduction to Large Language Models (LLMs)](02_intro_to_LLMs)	                            | Jingyan (Jane) Jiang, ANL
12:00PM | Pre-training on a Supercomputer - Part 1 | Sam Foreman, ANL
12:30PM	| *Lunch* |
1:30PM	|  Pre-training on a Supercomputer - Part 2 | Sam Foreman, ANL
2:30PM	|  Post-training (Finetuning/Alignment/RL  techniques) | Filippo Simini, ANL
4:00PM | Explainable AI for Science | Shilpika, ANL
4:30PM | *Break* |
5:30PM | Featured Speaker | Jack Dongarra

### Tuesday, August 4
Time    | Talk                                                                                          | Speaker
|--     |--                                                                                             |--
8:30AM | Welcome and introduction | Shilpika, ANL
8:35AM | Workflows for Science - Parsl, Balsam, etc. | Christine Simpson, ANL
9:30AM | Coupled Workflows for Science (Simulations + AI Workflows) | Riccardo Balin and Christine Simpson, ANL
10:30AM | *Break* |
10:50AM | Inference | Misha Salim, ANL
11:50 AM | Agentic Tools - Part 1 (Trinity/Hermes/OpenClaw) | Huihuo Zheng, ANL
12:30 PM | *Lunch* |
1:30 PM | [AI Testbed](04_AI_testbed)                                                  | Varuni Sastry and Murali Emani, ANL
3:00PM	|  Agentic Workflows for Science | Thang Pham, ANL
4:00PM | Agentic Tools - Part 2 (Academy) | Kyle Chard, UChicago/ANL
4:30PM	|  *Break*  |
5:30PM | Featured Speaker| Bill Gropp



At the beginning of the first day, we will temporarily split into two groups. Attendees can choose between [Introduction to Deep Learning](01novice_intro_to_deep_learning) and [Distributed Deep Learning](03_distributed_deep_learning).  

The "Introduction to deep learning" session will rely on Jupyter Notebooks which are targeted for running on [Google's Colaboratory Platform](https://colab.research.google.com) or [ALCF JupyterHub](https://jupyter.alcf.anl.gov/). The Colab platform gives the user a virtual machine in which to run Python codes including machine learning codes. The VM comes with a preinstalled environment that includes most of what is needed for these tutorials.

The other sessions involve Python scripts executed on the [Aurora](https://docs.alcf.anl.gov/aurora/getting-started-on-aurora/) and [AI Testbed](https://docs.alcf.anl.gov/ai-testbed/) platforms at ALCF.                                                                    | ...


## Reservations

- **Queue**: ATPESC (`-q ATPESC`)
- **Project/Allocation**: ATPESC2025 (`-A ATPESC2026`)
- Shared **directories**:
    - Aurora: `/flare/ATPESC2026`
    - Polaris: `/eagle/projects/ATPESC2026`


## Using Google Colab

Google Colab involves running Jupyter notebooks, which you will also be using next week. 

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


## Cerebras API key

For the [AI Testbed](04_AI_testbed/Cerebras/inference/README.md) hands on you will need a Cerebras Inference API key. 
Follow these instructions on your computer to setup Cerebras Inference API key.
- Visit <https://cloud.cerebras.ai> to sign up for an account
- Create an API key by navigating to "API Keys" on the left nav bar.
- Set your API key as an environment variable. You can do this by running the following command in your terminal: `export CEREBRAS_API_KEY="your-api-key-here"`


## Weights & Biases API key

For the [Training LLMs at Scale](06_training_LLMs_at_scale) session, you will need a Wandb api_key. 
Visit <https://docs.wandb.ai/quickstart/> to sign-up and get the key.
