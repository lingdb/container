#!/bin/bash
echo "Updating package database:"
apt-get update
apt-get install -y docker.io pwgen
/containerSetup/pullBaseImages.sh
/containerSetup/buildContainers.sh
