#!/bin/bash
mkdir /root/.ssh
echo "blah"
conda init bash
conda activate myenv
python -m ipykernel install --user --name=myenv


#"--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"
