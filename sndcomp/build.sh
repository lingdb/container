#!/bin/bash
if [ -f client_secrets.json ]; then
  dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  cd $dir
  source ../secrets/secrets.sh
  sed -e "s/<SECRET>/$secretMariaDB/g" getSndcomp.sh > getSndcomp.sh.tmp
  # Building image:
  image="lingdb/sndcomp"
  tag=$(grep version Dockerfile | grep -Po "\"[^\"]+\"" | sed -e "s/\"//g")
  docker build -t $image:$tag .
  docker tag -f $image:$tag $image:latest
  # Cleanup:
  rm getSndcomp.sh.tmp
else
  echo "Won't build lingdb.sndcomp due to missing file: 'client_secrets.json'."
fi
