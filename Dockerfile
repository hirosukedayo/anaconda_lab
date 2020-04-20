FROM continuumio/anaconda3:2019.10
ENV PATH $PATH:/opt/conda/bin

ENV WORKDIR /work
ENV PYTHONPATH ${WORKDIR}
WORKDIR ${WORKDIR}

# ---------------------------------
# install jupyter and jupyterlab env
# ---------------------------------
## install jupyter & vim
RUN pip install jupyter jupyter_nbextensions_configurator
### notebook vim
# RUN mkdir -p $(jupyter --data-dir)/nbextensions && \
#     cd $(jupyter --data-dir)/nbextensions && \
#     git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding &&\
#     jupyter nbextension enable vim_binding/vim_binding
COPY jupyter_settings/jupyter_notebook_config.py /root/.jupyter/
## install jupyter lab & vim
RUN pip install  jupyterlab && \
    jupyter serverextension enable --py jupyterlab
## notebooks vim
# RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
#     apt-get install -y nodejs && \
#     jupyter labextension install jupyterlab_vim
###  .py vim & theme
COPY jupyter_settings/commands.jupyterlab-settings /root/.jupyter/lab/user-settings/\@jupyterlab/codemirror-extension/commands.jupyterlab-settings
###  lab theme
COPY jupyter_settings/theme.jupyterlab-settings /root/.jupyter/lab/user-settings/\@jupyterlab/apputils-extension/themes.jupyterlab-settings
# ------------------------------------

COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

EXPOSE 8888
CMD jupyter lab
