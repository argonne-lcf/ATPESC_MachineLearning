# [ATPESC 2022](https://extremecomputingtraining.anl.gov/agenda-2022/)

The first two modules in this tutorial will rely on Jupyter Notebooks which are targeted for running on [Google's Colaboratory Platform](https://colab.research.google.com) or [ALCF JupyterHub](https://www.alcf.anl.gov/support-center/theta/jupyter-hub). The Colab platform gives the user a virtual machine in which to run Python codes including machine learning codes. The VM comes with a preinstalled environment that includes most of what is needed for these tutorials.

The latter two modules will be performed with simple Python scripts executed on the [Polaris](https://argonne-lcf.github.io/ThetaGPU-Docs/) and [AI Testbed](https://www.alcf.anl.gov/alcf-ai-testbed) platforms at ALCF. 

# Before You Arrive

Do the following before you come to the tutorial:
*  You need a Google Account to use Colaboratory
*  Goto [Google's Colaboratory Platform](https://colab.research.google.com) 
*  You should see this page
![start_page](README_imgs/colab_start_page.png)
*  Click on the `New Python Notebook` 
*  Now you will see a new notebook where you can type in python code.
![clean_page](README_imgs/collab_start_page1.png)
*  After you enter code, type `<shift>+<enter>` to execute the code cell.
*  A full introduction to the notebook environment is out of scope for this tutorial, but many can be found with a [simple Google search](https://www.google.com/search?q=jupyter+notebook+tutorial)
*  We will be using notebooks from this repository during the tutorial, so  you should be familiar with how to import them into Colaboratory
*  Now you can open the `File` menu at the top left and select `Open Notebook` which will open a dialogue box.
*  Select the `GitHub` tab in the dialogue box.
*  From here you can enter the url for the github repo: `https://github.com/argonne-lcf/ATPESC_MachineLearning` and hit `<enter>`.
![open_github](README_imgs/colab_open_github.png)
*  This will show you a list of the Notebooks available in the repo.
*  Select the `introduction.ipynb` file to open and work through it.
*  As each session of the tutorial begins, you will simply select the corresponding notebook from this list and it will create a copy for you in your Colaboratory account (all `*.ipynb` files in the Colaboratory account will be stored in your Google Drive).
* To use a GPU, in the notbook the select `Runtime` -> `Change Runtime Type` and you have a dropbox list of hardward settings to choose from where the notebook can run.
