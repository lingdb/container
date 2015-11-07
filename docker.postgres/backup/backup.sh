#!/bin/bash
# Name to use for the new database dump:
cd /backup
while true; do
  name=$(date -I)
  echo "Creating backup $name…"
  pg_dump -h postgres -U ielexuser ielexdb201510 > $name.sql
  # Keeping only 10 latest dumps:
  # Compare https://stackoverflow.com/a/10119963/448591
  ls -tr *sql | grep -v 'create\|dump.sql' | head -n -10 | xargs --no-run-if-empty rm
  # Sleep until next backup:
  echo "Sleeping until next backup…"
  sleep 4h
done
