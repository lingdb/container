#!/bin/bash
dir="/sndcomp"
src="https://github.com/lingdb/soundcomparisons"
tag="cb3b76bcb88719dc1388185f747e4c2dd5e050d5"
cd $dir
git clone $src $dir
git checkout $tag
pip install -r $dir/requirements.txt
cp $dir/config_example.py $dir/config.py
sed -i.bak "s/dbURI = 'mysql:\/\/root:1234@localhost\/v5'/dbURI = 'mysql:\/\/root:1234@mysql\/v5'/" $dir/config.py
secret=$(pwgen 32 1)
sed -i.bak "s/Zooj8eegie4sheequ2ohfoh6pu0goKae/$secret/" $dir/config.py
rm $dir/config.py.bak
mv /client_secrets.json $dir/
