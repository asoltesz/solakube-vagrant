#!/usr/bin/env bash


if [[ -f ".provisioned/ansible" ]]
then
    echo "Ansible is already installed"
    exit 0
fi

export DEBIAN_FRONTEND=noninteractive

sudo apt-add-repository ppa:ansible/ansible -y

#
# Add basic packages to the box
#
apt-get update

apt-get -yq install ansible

echo "Ansible installation successful"

# Marking this step provisioned
touch .provisioned/ansible

