#!/bin/bash
while true; do
  t=$(date)
  echo "Waking up, it's $t."
  python manage.py computeNexusExport
  sleep 1m
done
