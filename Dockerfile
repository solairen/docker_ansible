FROM python:3.14-slim

LABEL maintainer=michal@michaloleszek.com
LABEL docker_registry=https://hub.docker.com/r/moleszek/ansible
LABEL org.opencontainers.image.source=https://github.com/solairen/docker_ansible
LABEL org.opencontainers.image.description="Docker image with preinstalled Ansible."

ARG workdir=/ansible
ARG ansible_config=/etc/ansible

COPY ansible.cfg requirements.txt /

# hadolint ignore=DL3008
RUN apt-get update && apt-get install --no-install-recommends -y \
    unzip wget sshpass gnupg software-properties-common less \
    && apt-get autoremove -y && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir ${workdir} \
    && pip install -r /requirements.txt --no-cache-dir \
    && rm /requirements.txt \
    && mkdir -p ${ansible_config} && mv ansible.cfg ${ansible_config}

WORKDIR ${workdir}

ENTRYPOINT [ "bash" ]
