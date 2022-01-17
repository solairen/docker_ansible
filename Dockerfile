FROM python:3.10-slim

LABEL maintainer="mrsolairen@outlook.com"

ARG workdir=/ansible

RUN mkdir ${workdir}
WORKDIR ${workdir}

COPY requirements.txt ${workdir}
RUN pip install -r requirements.txt

RUN rm requirements.txt

RUN mkdir -p /etc/ansible
COPY ansible.cfg /etc/ansible

ENTRYPOINT [ "ansible-playbook" ]
