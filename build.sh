#!/bin/bash
# https://stackoverflow.com/a/246128/448591
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
#(./pull.sh)
# Building containers…
./withCompose.sh build --no-cache $@
