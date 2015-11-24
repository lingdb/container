#!/bin/bash
dir="/sndcomp"
cd $dir
pip install -r $dir/requirements.txt
cp $dir/config_example.py $dir/config.py
secret="<SECRET>"
sed -i.bak "s/dbURI = 'mysql:\/\/root:1234@localhost\/v5'/dbURI = 'mysql:\/\/root:$secret@mysql\/v5'/" $dir/config.py
sed -i.bak "s/host='127.0.0.1'/host='0.0.0.0'/" $dir/config.py
secret=$(pwgen 32 1)
sed -i.bak "s/Zooj8eegie4sheequ2ohfoh6pu0goKae/$secret/" $dir/config.py
rm $dir/config.py.bak
mv /client_secrets.json $dir/
