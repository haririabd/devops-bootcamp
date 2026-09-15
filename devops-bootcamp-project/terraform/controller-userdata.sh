#!/bin/bash
apt-get update -y
apt-get install -y ansible

mkdir -p /home/ubuntu/ansible
cat > /home/ubuntu/ansible/requirements.yaml << 'ANSIBLE_REQS'
${requirements_yaml}
ANSIBLE_REQS

chown -R ubuntu:ubuntu /home/ubuntu/ansible
sudo -u ubuntu ansible-galaxy install -r /home/ubuntu/ansible/requirements.yaml
