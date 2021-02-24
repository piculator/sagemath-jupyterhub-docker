FROM sagemath/sagemath

ARG JUPYTERHUB_VERSION=1.3.0

RUN /home/sage/sage/local/bin/python3 -m pip install --no-cache -U pip
RUN /home/sage/sage/local/bin/python3 -m pip install --no-cache jupyterhub==$JUPYTERHUB_VERSION

# Fix 500 Internal Server Error caused by the higher version of tornado
RUN /home/sage/sage/local/bin/python3 -m pip install --no-cache -U nbconvert


USER sage
ENV HOME=/home/sage
RUN mkdir /home/sage/notebooks
WORKDIR $HOME/notebooks


CMD ["/home/sage/sage/local/bin/jupyterhub-singleuser"]