FROM continuumio/miniconda3
FROM jupyter/datascience-notebook

WORKDIR /app

COPY environment.yml .
RUN conda env create -f environment.yml

COPY test.py .
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "myenv", "python", "test.py"]

#EXPOSE 8888
#RUN /bin/bash -c "conda env create -f environment.yml" && /bin/bash -c "source activate myenv" 

# Make RUN commands use the new environment:
#RUN conda init bash
#RUN conda activate myenv
#RUN echo "conda activate myenv" > ~/.bashrc
#SHELL ["conda", "run", "-n", "myenv", "/bin/bash", "-c"]
   
# The code to run when container is started:
#COPY test.ipynb .
#COPY test.py .
#ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "myenv"]
#ENTRYPOINT ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]

# docker build -t my_python_image .
# docker run -it --entrypoint /bin/bash my_python_image
# docker run -p 8888:8888 my_python_image

