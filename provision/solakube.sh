#!/usr/bin/env bash

SK_VERSION="0.6.1"

set -e

if [[ -f ".provisioned/solakube" ]]
then
    echo "SolaKube is already installed"
    exit 0
fi

# Should be nothing here but making easier to re-provision
rm -Rf solakube

# Fetching out the SolaKube sources
git clone https://github.com/asoltesz/hetzner-k8s-builder.git solakube

cd solakube

# Switching to the release version

git checkout -b v${SK_VERSION} v${SK_VERSION}

echo "SolaKube GitHUB checkout successful"


mkdir -p ~/.kube

rm -Rf ~/.solakube

mkdir -p ~/.solakube/andromeda

cp templates/variables.sh ~/.solakube/andromeda/

# Adding a dummy ansible vault password file
cp /vagrant/provision/ansible-vault-pass ~/.solakube/

echo "Extending .bashrc"
cat /vagrant/provision/bashrc.txt >> ~/.bashrc

echo "Initializing Terraform"

export SK_CLUSTER="andromeda"
export SK_SCRIPT_HOME=~/solakube/scripts
~/solakube/scripts/sk init

# Loading Ansible roles from their source locations
cd ~/solakube/ansible
ansible-galaxy install -r requirements.yml

# Marking this step provisioned
touch ~/.provisioned/solakube

echo
echo "--------------------------------------------"
echo "SolaKube was installed successfully."
echo "--------------------------------------------"
echo