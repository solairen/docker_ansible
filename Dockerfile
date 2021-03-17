FROM moleszek/flake:1.1

LABEL maintainer="michal.oleszek@oultook.com"

RUN mkdir /ansible
WORKDIR /ansible

RUN apk add --no-cache ansible \
    && rm -rf /var/cache/apk/*
RUN pip install pywinrm2
RUN pip install jmespath
RUN pip install PyVmomi

RUN mkdir /etc/ansible
COPY ansible.cfg /etc/ansible

ENTRYPOINT [ "ansible-playbook" ]