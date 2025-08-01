# Llama 2 7B ModelBox on SambaNova DataScale SN30

1. Create a `llama7b` folder in your home repo, and copy the following two bash scripts `/projects/aitestbed_tutorial/llama7b_modelbox/7B_modelbox_fine_tuning_setup.sh` and `/projects/aitestbed_tutorial/llama7b_modelbox/7B_modelbox_fine_tuning_run.sh` to it. For example:

   ```bash
   cd $HOME
   mkdir llama7b
   cd llama7b
   cp /projects/aitestbed_tutorial/llama7b_modelbox/*.sh ./
   ```

2. Open the `7B_modelbox_fine_tuning_run.sh` file, and set the number of train steps. By default, it is set to 10, but you can change it. For example:

   ```bash
   export STEPS_THIS_RUN=10
   ```

   **Note**: make sure you set the `OUTPUT_PATH` in both `7B_modelbox_fine_tuning_setup.sh` and `7B_modelbox_fine_tuning_run.sh`, depending on where you copied the bash scripts. If you placed them under `$HOME/llama7b` as instructed in Step 1, no changes are needed. 

3. SambaNova uses SLURM for job submission and queueing. Submit the job by executing the `7B_modelbox_fine_tuning_setup.sh` bash script. For example:

   ```bash
   ./7B_modelbox_fine_tuning_setup.sh 1 llama_test
   ```

   Here, 1 refers to the number of nodes, and `llama_test` is the name of the job (you can change it).

4. You can follow the status of your job using: `squeue`.
   
5. The log file is located at `$HOME/llama7b` and is named `7B_MODELBOX_FT_1_nodes.out`:

   <details>
    <summary>Example of information in the log file </summary>
    
    ```bash
    ^M  0%|          | 1/3432 [01:38<94:08:33, 98.78s/it]2024-11-14 23:48:07,321 - apps.nlp.transformers_on_rdu.tasks.lm_tasks.gpt2_task - Process ID 3932735 - info     - epoch:0|local_step:1|global_step:1|average_loss:7.26778|steps_per_second:0.01017|step_loss:7.26778|learning_rate:1.00e-05|eval_step:0.00000|validation_average_loss:0.00000|validation_steps_per_second:0.00000|validation_total_loss:0.00000|eval_acc:0.00000
    ^M  0%|          | 2/3432 [02:42<74:28:14, 78.16s/it]2024-11-14 23:49:11,050 - apps.nlp.transformers_on_rdu.tasks.lm_tasks.gpt2_task - Process ID 3932735 - info     - epoch:0|local_step:2|global_step:2|average_loss:6.13322|steps_per_second:0.01569|step_loss:6.13322|learning_rate:1.00e-05|eval_step:0.00000|validation_average_loss:0.00000|validation_steps_per_second:0.00000|validation_total_loss:0.00000|eval_acc:0.00000
    ^M  0%|          | 3/3432 [03:46<68:10:51, 71.58s/it]2024-11-14 23:50:14,800 - apps.nlp.transformers_on_rdu.tasks.lm_tasks.gpt2_task - Process ID 3932735 - info     - epoch:0|local_step:3|global_step:3|average_loss:2.74683|steps_per_second:0.01569|step_loss:2.74683|learning_rate:1.00e-05|eval_step:0.00000|validation_average_loss:0.00000|validation_steps_per_second:0.00000|validation_total_loss:0.00000|eval_acc:0.00000
    ^M  0%|          | 4/3432 [04:49<65:12:07, 68.47s/it]2024-11-14 23:51:18,510 - apps.nlp.transformers_on_rdu.tasks.lm_tasks.gpt2_task - Process ID 3932735 - info     - epoch:0|local_step:4|global_step:4|average_loss:2.52686|steps_per_second:0.01570|step_loss:2.52686|learning_rate:1.00e-05|eval_step:0.00000|validation_average_loss:0.00000|validation_steps_per_second:0.00000|validation_total_loss:0.00000|eval_acc:0.00000
    ^M  0%|          | 5/3432 [05:53<63:34:23, 66.78s/it]2024-11-14 23:52:22,294 - apps.nlp.transformers_on_rdu.tasks.lm_tasks.gpt2_task - Process ID 3932735 - info     - epoch:0|local_step:5|global_step:5|average_loss:3.26106|steps_per_second:0.01568|step_loss:3.26106|learning_rate:1.00e-05|eval_step:0.00000|validation_average_loss:0.00000|validation_steps_per_second:0.00000|validation_total_loss:0.00000|eval_acc:0.00000
    ^M  0%|          | 6/3432 [06:57<62:42:02, 65.89s/it]2024-11-14 23:53:26,437 - apps.nlp.transformers_on_rdu.tasks.lm_tasks.gpt2_task - Process ID 3932735 - info     - epoch:0|local_step:6|global_step:6|average_loss:2.04121|steps_per_second:0.01559|step_loss:2.04121|learning_rate:1.00e-05|eval_step:0.00000|validation_average_loss:0.00000|validation_steps_per_second:0.00000|validation_total_loss:0.00000|eval_acc:0.00000
    ^M  0%|          | 7/3432 [08:02<62:08:14, 65.31s/it]2024-11-14 23:54:30,571 - apps.nlp.transformers_on_rdu.tasks.lm_tasks.gpt2_task - Process ID 3932735 - info     - epoch:0|local_step:7|global_step:7|average_loss:0.80922|steps_per_second:0.01559|step_loss:0.80922|learning_rate:1.00e-05|eval_step:0.00000|validation_average_loss:0.00000|validation_steps_per_second:0.00000|validation_total_loss:0.00000|eval_acc:0.00000
    ^M  0%|          | 8/3432 [09:06<61:43:39, 64.90s/it]2024-11-14 23:55:34,590 - apps.nlp.transformers_on_rdu.tasks.lm_tasks.gpt2_task - Process ID 3932735 - info     - epoch:0|local_step:8|global_step:8|average_loss:0.29082|steps_per_second:0.01562|step_loss:0.29082|learning_rate:1.00e-05|eval_step:0.00000|validation_average_loss:0.00000|validation_steps_per_second:0.00000|validation_total_loss:0.00000|eval_acc:0.00000
    ^M  0%|          | 9/3432 [10:10<61:28:37, 64.66s/it]2024-11-14 23:56:38,708 - apps.nlp.transformers_on_rdu.tasks.lm_tasks.gpt2_task - Process ID 3932735 - info     - epoch:0|local_step:9|global_step:9|average_loss:0.26743|steps_per_second:0.01560|step_loss:0.26743|learning_rate:1.00e-05|eval_step:0.00000|validation_average_loss:0.00000|validation_steps_per_second:0.00000|validation_total_loss:0.00000|eval_acc:0.00000
    ^M  0%|          | 10/3432 [11:13<61:11:40, 64.38s/it]2024-11-14 23:57:42,463 - apps.nlp.transformers_on_rdu.tasks.lm_tasks.gpt2_task - Process ID 3932735 - info     - epoch:0|local_step:10|global_step:10|average_loss:0.34102|steps_per_second:0.01569|step_loss:0.34102|learning_rate:1.00e-05|eval_step:0.00000|validation_average_loss:0.00000|validation_steps_per_second:0.00000|validation_total_loss:0.00000|eval_acc:0.00000

    ...

    2024-11-15 00:06:14,120 - apps.nlp.transformers_on_rdu.tasks.lm_tasks.gpt2_task - Process ID 3932735 - info     - {'e2e_train_time': 1185.6368191242218, 'e2e_training_tokens_per_second': 4421.994927479299, 'training_tokens_per_second(exclude warmup overhead)': 8224.118016154427, 'final_loss': 0.27188825607299805}
    ```

    </details>

  6. Once the job is completed, you can see the accuracy metrics and checkpoint(s) (if enabled) at `/data/scratch/$USER/7B_MODELBOX_FT_1_nodes` 
