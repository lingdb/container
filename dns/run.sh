#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
echo "Starting skydns.docker0…"
(cd skydns  && ./run.sh)
echo "Starting skydock.docker0…"
(cd skydock && ./run.sh)
