#!/bin/bash
if [ -f client_secrets.json ]; then
  docker build -t lingdb.sndcomp .
else
  echo "Won't build lingdb.sndcomp due to missing file: 'client_secrets.json'."
fi
