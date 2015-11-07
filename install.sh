#!/bin/bash
echo "Updating package database:"
apt-get update
apt-get install -y docker.io
echo "Pulling base images:"
/containerSetup/pullBaseImages.sh
