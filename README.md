### About:
* OS: Python 3.12.1

This docker container contains:
* [Ansible](https://docs.ansible.com/ansible/latest/index.html)
* [jmespath plugin](https://pypi.org/project/jmespath/)

### Additional information
This docker container contains **ansible.cfg**.<br/>
**ansible.cfg** is placed in **/etc/ansible**

### How to build or download:
#### To build docker images from Dockerfile:
* docker build . -t {tagname}

#### Download from Docker repository:
* docker pull moleszek/ansible:latest

### To run ansible script using ansible Docker image directly:
* docker run -it --rm -v {localFolderPath}:/home moleszek/ansible:latest