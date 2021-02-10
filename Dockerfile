FROM continuumio/miniconda3
FROM jupyter/datascience-notebook

WORKDIR /app

# Create the environment:
COPY environment.yml .
RUN conda env create -f environment.yml

# Make RUN commands use the new environment:
#RUN conda init bash
#RUN conda activate myenv
#RUN echo "conda activate myenv" > ~/.bashrc
SHELL ["conda", "run", "-n", "myenv", "/bin/bash", "-c"]

# The code to run when container is started:
COPY test.ipynb .
ENTRYPOINT ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
