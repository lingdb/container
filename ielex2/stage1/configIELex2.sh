#!/bin/bash
dir="/ielex2"
echo "Installing REQUIREMENTS"
cd $dir
pip install -r REQUIREMENTS
#rm -rf .git{,ignore,modules}
cd static
bower install --allow-root ./bower.json
cd ..
bash
