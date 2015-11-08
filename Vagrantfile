# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Fetch box from https://atlas.hashicorp.com/ubuntu/boxes/vivid64
  config.vm.box = "ubuntu/trusty64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Because of $reasons we share the containerSetup folder.
  config.vm.synced_folder ".", "/containerSetup"

  # VirtualBox specific setup:
  config.vm.provider "virtualbox" do |vb|
    vb.name = "com.github.lingdb.container"
    vb.memory = "1024"
    #vb.gui = true
  end

  config.vm.provision "shell", path: "install.sh"
end
