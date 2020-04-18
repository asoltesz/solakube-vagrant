#!/usr/bin/env bash

mkdir -p .provisioned
chmod 777 .provisioned
chown vagrant:vagrant .provisioned

if [[ -f ".provisioned/basic-packages" ]]
then
    echo "Basic-Packages are already installed"
    exit 0
fi

#
# Add basic packages to the box
#
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -yq install git mc gettext-base unzip nano


echo "Basic-packages installation successful"

# Marking this step provisioned
touch .provisioned/basic-packages

