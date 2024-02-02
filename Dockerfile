FROM python:3.12.1-slim

LABEL maintainer="solairen@solairen.tech"

ARG workdir=/ansible

RUN mkdir ${workdir}
WORKDIR ${workdir}

COPY requirements.txt ${workdir}

RUN pip install -r requirements.txt --no-cache-dir && rm requirements.txt && mkdir -p /etc/ansible

COPY ansible.cfg ${workdir}

ENTRYPOINT [ "bash" ]