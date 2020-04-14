FROM python:3.6-slim
RUN echo 'Pulling base image.'
# Here's where python:3.6-slim is coming from:  https://hub.docker.com/_/python.

RUN echo 'Installing Python packages.'
ADD requirements.txt /
RUN pip install -r /requirements.txt

RUN echo 'Adding the notebooks directory, the scripts directory, and docker-entrypoint.sh.'
#ADD notebooks/ /workspace/notebooks
#ADD scripts/ /workspace/scripts

RUN echo 'Setting /workspace as WORKDIR.'
WORKDIR /workspace

RUN echo 'Exposing port 8888 for Jupyter Notebooks.'
EXPOSE 8888

CMD jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='' --NotebookApp.password=''