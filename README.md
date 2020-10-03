### About:
* OS: moleszek/flake:1.0

This docker container contains:
* [Ansible](https://docs.ansible.com/ansible/latest/index.html)
* [pywinrm plugin](https://pypi.org/project/pywinrm/0.2.2/)
* [jmespath plugin](https://pypi.org/project/jmespath/)
* [PyVmomi plugin](https://pypi.org/project/pyvmomi/)

### Additional information
This docker container contains **ansible.cfg**.<br/>
**ansible.cfg** is copied to **/etc/ansible**

### How to build or download:
#### To build docker images from Dockerfile:
* docker build . -t {tagname}

#### Download from Docker repository:
* docker pull moleszek/ansible:1.1

### To run ansible script using ansible Docker image directly:
* docker run -it --rm -v {localFolderPath}:/home moleszek/ansible:1.1 -i inventory.yml {playbook}.yml

### To run ansible script form docker compose:
* docker-compose run --rm ansible -i inventory.yml {playbook}.yml