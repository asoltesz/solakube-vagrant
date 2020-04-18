#!/usr/bin/env bash

set -e

if [[ -f ".provisioned/terraform-ansible-provisioner" ]]
then
    echo "Ansible Terraform Provisioner is already installed"
    exit 0
fi

DIR=~/.terraform.d/plugins/linux_amd64
mkdir -p ${DIR}

# Adding the Ansible provisioner via the deployer script
curl -sL \
    https://github.com/radekg/terraform-provisioner-ansible/releases/download/v2.3.3/terraform-provisioner-ansible-linux-amd64_v2.3.3 \
  --output ${DIR}/terraform-provisioner-ansible_v2.3

chmod +x ${DIR}/terraform-provisioner-ansible_v2.3

echo "Ansible Terraform Provisioner installation successful"

# Marking this step provisioned
touch .provisioned/terraform-ansible-provisioner

