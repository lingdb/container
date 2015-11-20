#!/bin/bash
# Chdir to file location:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Creating new backup:
name="$(date -I).images.tar"
echo "Creating $name…"
docker images --filter "label=lingdb" -q | xargs docker save -o $name
# Removing some to keep last 5:
echo "Keeping only 5 latest backups…"
ls -tr *tar | head -n -5 | xargs --no-run-if-empty rm
