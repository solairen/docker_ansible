FROM python:3.14-slim

LABEL maintainer=michal@michaloleszek.com
LABEL docker_registry=https://hub.docker.com/r/moleszek/ansible
LABEL org.opencontainers.image.source=https://github.com/solairen/docker_ansible
LABEL org.opencontainers.image.description="Docker image with preinstalled Ansible."

ARG workdir=/ansible
ARG ansible_config=/etc/ansible

COPY ansible.cfg ${ansible_config}/ansible.cfg
COPY requirements.txt ${workdir}/requirements.txt

# hadolint ignore=DL3008
RUN apt-get update && apt-get install --no-install-recommends -y \
    unzip curl sshpass gnupg less \
    && apt-get autoremove -y && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip install -r /ansible/requirements.txt --no-cache-dir \
    && rm /ansible/requirements.txt

WORKDIR ${workdir}

ENTRYPOINT [ "bash" ]
