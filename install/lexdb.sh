#!/bin/bash
# Fetching copy of the lexdb repository:
# Got to move .gitignore out of the way intermediate,
# because hg won't clone into a non empty repo.
echo "Taking care of lexdb:"
apt-get install -y mercurial
mv /containerSetup/lexdb/.gitignore /tmp/lexdb.gitignore
hg clone https://bitbucket.org/evoling/lexdb /containerSetup/lexdb
mv /tmp/lexdb.gitignore /containerSetup/lexdb/.gitignore
hg checkout -R /containerSetup/lexdb py2.7-django1.8
