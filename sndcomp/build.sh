#!/bin/bash
if [ -f client_secrets.json ]; then
  image="lingdb/sndcomp"
  tag=$(date -I | sed -e 's/-/./g')
  docker build -t $image:$tag .
  docker tag -f $image:$tag $image:latest
else
  echo "Won't build lingdb.sndcomp due to missing file: 'client_secrets.json'."
fi
