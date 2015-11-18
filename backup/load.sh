#!/bin/bash
# Chdir to file location:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Creating new backup:
echo "Loading images from $1…"
docker load -i $1
