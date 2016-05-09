#!/bin/bash
dir="/CoBL"
cd $dir
echo "Installing js dependencies"
mv .git /tmp/git_configIELex2.sh
cd static
npm install
bower install --allow-root ./bower.json
grunt
cd ..
mv /tmp/git_configIELex2.sh .git
bash
