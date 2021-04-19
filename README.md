# ansible-roles-rhel7

echo "export PATH=\"`python3 -m site --user-base`/bin:$PATH\"" >> ~/.bashrc
source ~/.bashrc



# ansible-playbook -i "localhost," -c local test.yml
---
- hosts: localhost
  tasks:
    - name: test source profile
      shell: source /etc/bashrc
      register: output 
      args:
        executable: /bin/bash

    - debug: msg="{{ output }}" 


docker build -t prashanth-debian:latest .
docker run --rm -it prashanth-debian

