FROM sagemath/sagemath

ARG JUPYTERHUB_VERSION=1.3.0

RUN /home/sage/sage/local/bin/python3 -m pip install --no-cache -U pip
RUN /home/sage/sage/local/bin/python3 -m pip install --no-cache jupyterhub==$JUPYTERHUB_VERSION

ENV HOME=/home/sage
WORKDIR $HOME
USER sage

CMD ["/home/sage/sage/local/bin/jupyterhub-singleuser"]