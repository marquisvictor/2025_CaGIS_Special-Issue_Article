# Environment

Store detailed information about the hardware and software environment requirements for procedures and code here. You may also document a recipe or container of the computational environment here.

This directory is specifically for hardware and software environments.
Contextual factors or confounds of human subjects research or field research should be communicated in protocol documents and stored in the `protocols` directory.

For users of R, our template code, at a minimum, saves environment information using the `sessionInfo()` function.


## 🔧 Setup Instructions

To re-run the scripts and notebooks in this repository on your local machine, follow the steps below. A `requirements.txt` file is provided to ensure all necessary Python packages are installed.

### 1. Create and activate a conda environment

```bash
conda create --name viz_env python=3.10
conda activate viz_env```


💡 Tip: You can replace viz_env with any environment name you prefer.


### 2. Install required packages

`pip install -r requirements.txt`



