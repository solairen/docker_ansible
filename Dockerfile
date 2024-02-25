FROM python:3.12.1-slim

LABEL maintainer=solairen@solairen.tech
LABEL python=3.12.1
LABEL ansible=9.2.0
LABEL docker_registry=https://hub.docker.com/r/moleszek/ansible
LABEL org.opencontainers.image.source=https://github.com/solairen/docker_ansible
LABEL org.opencontainers.image.description="Docker image with preinstalled Ansible."

ARG workdir=/ansible
ARG ansible_config=/etc/ansible

COPY ansible.cfg requirements.txt /

RUN apt-get update && apt-get install unzip wget sshpass gnupg software-properties-common less -y && apt-get autoremove && apt-get clean \
    mkdir ${workdir} && \
    pip install -r /requirements.txt --no-cache-dir \
    && rm /requirements.txt \
    && mkdir -p ${ansible_config} && mv ansible.cfg ${ansible_config}

WORKDIR ${workdir}

ENTRYPOINT [ "bash" ]