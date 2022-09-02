#!/bin/sh

# Ansible
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
rm get-pip.py
python3 -m pip install --user ansible

# Dependencies
ansible-galaxy collection install ansible.posix
