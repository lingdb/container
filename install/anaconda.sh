#!/bin/bash
# Steps to install Anaconda. This script should be run as user vagrant.
# This script is triggered by ielex2.sh, and will than be executed as user vagrant.
# Fetch Anaconda:
wget -q -O /tmp/Anaconda.sh "https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda2-2.4.0-Linux-x86_64.sh"
# Install Anaconda:
chmod u+x /tmp/Anaconda.sh
/tmp/Anaconda.sh -b
echo "export PATH=\"/home/vagrant/anaconda2/bin:$PATH\"" >> /home/vagrant/.bashrc
