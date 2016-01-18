#!/bin/bash
# Name to use for the new database dump:
cd /backup
while true; do
  t=$(date)
  echo "Waking up, it's $t."
  name=$(date -I)
  echo "Creating backup $name…"
  pg_dump -h postgres -U ielexuser ielexdb201510 > $name.sql
  echo "Compressing backup $name…"
  bzip2 -f $name.sql
  # Keeping only 10 latest dumps:
  # Compare https://stackoverflow.com/a/10119963/448591
  ls -tr *sql.bz2 | grep -v 'create\|dump.sql' | head -n -10 | xargs --no-run-if-empty rm
  # Sleep until next backup:
  echo "Sleeping until next backup…"
  sleep 4h
done
