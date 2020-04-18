#!/usr/bin/env bash

#
# Cleaning after project builds
#

# Dropping Vagrant boxes

vagrant box remove ubuntu/bionic64

vagrant box remove asoltesz/solakube


# Removing the vm of the current test instance

vagrant destroy solakube
