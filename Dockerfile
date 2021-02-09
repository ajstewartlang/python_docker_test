FROM continuumio/miniconda3
FROM jupyter/datascience-notebook

WORKDIR /app

# Create the environment:
COPY environment.yml .
RUN conda env create -f environment.yml

# Make RUN commands use the new environment:
# SHELL ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
SHELL ["conda", "activate", "myenv"]

# The code to run when container is started:
COPY test.ipynb .
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
