# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.box = "ubuntu/trusty64"

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
  config.vm.synced_folder "../website", "/usr/share/nginx/html"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # For better db password than '1234' see [1].
  # For details on hhvm setup see [2].
  # [1]: https://github.com/Lukx/vagrant-lamp/blob/master/components/mariadb.sh
  # [2]: https://vexxhost.com/resources/tutorials/how-to-setup-hhvm-on-ubuntu-14-04/
  config.vm.provision "shell", inline: <<-SHELL
     echo "Installing mysql-server:"
     export DEBIAN_FRONTEND=noninteractive
     debconf-set-selections <<< 'mariadb-server-5.5 mysql-server/root_password password 1234'
     debconf-set-selections <<< 'mariadb-server-5.5 mysql-server/root_password_again password 1234'
     apt-get install -y mariadb-server
     service mysql start
     echo "CREATE DATABASE IF NOT EXISTS v4 CHARACTER SET utf8;"|mysql -uroot -p1234
     echo "FIXME REMEMBER DATABASE SETUP!"
     echo "Installing nginx:"
     apt-get install -y nginx
     echo "Installing hhvm:"
     apt-get install -y software-properties-common
     apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
     add-apt-repository "deb http://dl.hhvm.com/ubuntu $(lsb_release -sc) main"
     apt-get update
     apt-get install -y hhvm
     /usr/share/hhvm/install_fastcgi.sh
     service hhvm restart
     service nginx restart
  SHELL
end
