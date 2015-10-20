# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Custom code the check for database files:
  ["create.sql","dump.sql"].each{|name|
    path = "database/"+name
    if !File.exist?(path)
      raise LoadError.new("Necessary file not found: "+path)
    end
  }

  # Fetch box from https://atlas.hashicorp.com/ubuntu/boxes/vivid64
  # Using vivid64 instead of trusty to have systemd
  config.vm.box = "ubuntu/vivid64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080

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
    vb.name = "SoundComparisons"
    #vb.gui = true
    #vb.memory = "1024"
  end

  # Provision using install.sh
  config.vm.provision "shell", path: "install.sh"
end
