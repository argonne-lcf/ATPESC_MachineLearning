# Sambanova

## Connection to Sambanova 

Connection to a SambaNova node is a two-step process. The first step is to `ssh` to the `login node`. The second step is to log in to a SambaNova node from the `login node`.

![Sambanova connection diagram](./sambanova_login.jpg)

Login to the Sambanova login node from your local machine.  This uses the **MobilePASS+** token generated every time you log in to the system. 

In the examples below, replace ALCFUserID with your ALCF user id.
```bash
ssh ALCFUserID@sambanova.alcf.anl.gov
Password: < MobilePASS+ code >
```

Note: Use the ssh "-v" option in order to debug any ssh problems.

Once you are on the login node, ssh to one of the sambanova nodes.
```bash
ssh sn30-r1-h1       
```

You can also ssh to `sn30-r1-h1` , `sn30-r1-h2`, `sn30-r2-h1`, `sn30-r2-h2`, `sn30-r3-h1`, `sn30-r3-h2`, `sn30-r4-h1`, `sn30-r4-h2`.

## Pre-Built Sample Venv 

Sambanova software stack and associated environmental variables are automatically setup at login for a SN30 node. 

Each of the samples or application examples provided by SambaNova has its own pre-built virtual environment which can be readily used. They are present in the `/opt/sambaflow/apps/` directory tree within each of the applications. 


## Run Examples

Refer to respective instructions below.

Main examples:
* [GPT 1.5B](./gpt15b.md)


## Additional Resources

* [ALCF Sambanova Documentation](https://docs.alcf.anl.gov/ai-testbed/sambanova/getting-started/)
* [Sambanova Documentation](https://docs.sambanova.ai/developer/latest/sambaflow-intro.html) 
* Sambanova applications path: `/opt/sambaflow/apps/`
* Sambanova model scripts: `/data/ANL/scripts/`
* Important datasets: `/software/sambanova/dataset/`
