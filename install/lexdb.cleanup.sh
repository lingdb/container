#!/bin/bash
# Script to clean up the lexdb directory filled by lexdb.sh
lexdb="/containerSetup/lexdb"
cp $lexdb/.gitignore /tmp/lexdb.gitignore
rm -rf $lexdb
mkdir $lexdb
mv /tmp/lexdb.gitignore $lexdb/.gitignore
