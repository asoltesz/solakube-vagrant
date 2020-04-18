Vagrant.configure("2") do |config|

    # Based on Ubuntu 18.04 (latest)
    config.vm.box = "ubuntu/bionic64"

    config.vm.box_url = "http://files.vagrantup.com/ubuntu/bionic64.box"
    config.vm.hostname = "solakube"
    config.vm.define "solakube"
    config.vm.provider :virtualbox do |vb|
        vb.name = "solakube"
    end

    # Installing basic packages
    config.vm.provision "shell",
        path: "provision/basic-packages.sh"

    # Installing Ansible
    config.vm.provision "shell",
        path: "provision/ansible.sh"

    # Installing Terraform
    config.vm.provision "shell",
        path: "provision/terraform.sh"

    # Installing Terraform
    config.vm.provision "shell",
        path: "provision/ansible-terraform-provisioner.sh",
        privileged: false

    # Installing Helm
    config.vm.provision "shell",
        path: "provision/helm.sh"

    # Installing KubeCtl
    config.vm.provision "shell",
        path: "provision/kubectl.sh"

    # Installing SolaKube
    config.vm.provision "shell",
        path: "provision/solakube.sh",
        privileged: false
end

