#!/usr/bin/env bash

set -e

if [[ -f ".provisioned/kubectl" ]]
then
    echo "Kubectl is already installed"
    exit 0
fi

echo "Downloading kubectl..."

curl --silent -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.11/bin/linux/amd64/kubectl

# Make the kubectl binary executable.

chmod +x ./kubectl

# Move the binary in to your PATH.

mv ./kubectl /usr/local/bin/kubectl

# Test to ensure the version you installed is up-to-date:

echo "---------------------"
kubectl version --client
echo "---------------------"

echo "Kubectl installation successful"

# Marking this step provisioned
touch .provisioned/kubectl

