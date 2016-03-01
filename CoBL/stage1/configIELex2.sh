#!/bin/bash
dir="/CoBL"
echo "Installing REQUIREMENTS"
cd $dir
pip install -r REQUIREMENTS
mv .git /tmp/git_configIELex2.sh
cd static
npm install
bower install --allow-root ./bower.json
grunt
cd ..
mv /tmp/git_configIELex2.sh .git
bash
