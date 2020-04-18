# SolaKube Vagrant box

A pre-built Vagrant box for easier use of SolaKube in a predictable environment.
 
Based on Ubuntu 18.04 and includes all of the dependencies of SolaKube (Ansible, Terraform...etc).

Contains the SolaKube git repository at **version 0.6** (can be updated and switched to a newer release or the latest development state if needed).

# Usage

Usage of the box is described in the [SolaKube](https://github.com/asoltesz/solakube) repo docs.

# Building

Import the Ubuntu base box with setup.sh.

Start the building/provisioning process:

~~~
vagrant up
~~~
