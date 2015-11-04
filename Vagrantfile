# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Fetch box from https://atlas.hashicorp.com/ubuntu/boxes/vivid64
  # Using vivid64 instead of trusty to have systemd
  config.vm.box = "ubuntu/trusty64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Because of $reasons we share the containerSetup folder.
  config.vm.synced_folder ".", "/containerSetup"

  # VirtualBox specific setup:
  config.vm.provider "virtualbox" do |vb|
    vb.name = "com.github.lingdb.container"
    #vb.gui = true
    #vb.memory = "1024"
  end

  # Provision using install.sh
  config.vm.provision "shell", path: "install.sh"
end
