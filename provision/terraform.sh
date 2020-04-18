#!/usr/bin/env bash

set -e

if [[ -f ".provisioned/terraform" ]]
then
    echo "Terraform is already installed"
    exit 0
fi

FILE=terraform_0.12.24_linux_amd64.zip

wget -q https://releases.hashicorp.com/terraform/0.12.24/${FILE}

sudo unzip -o ./${FILE} -d /usr/local/bin/

rm ${FILE}*

terraform -v

echo "Terraform installation successful"

# Marking this step provisioned
touch .provisioned/terraform

