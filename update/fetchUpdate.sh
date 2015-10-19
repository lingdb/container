#!/bin/bash
echo "Fetching update for container repo:"
git -C /containerSetup pull origin master
git -C /containerSetup submodule update --init --recursive
