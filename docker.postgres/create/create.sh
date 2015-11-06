#!/bin/bash
cd /create
pg="psql -h postgres -U ielexuser"
echo "DROP DATABASE IF EXISTS ielexdb201510;" | $pg
echo "CREATE DATABASE ielexdb201510 WITH OWNER = ielexuser;" | $pg
#$pg ielexdb201510 < dump.sql
