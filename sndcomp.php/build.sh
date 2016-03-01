#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Checking src dir existance:
cd $dir
if [ ! -d src ]; then
  echo "src directory doesn't exist, cloning soundcomparisons:php…"
  git clone -b php https://github.com/lingdb/soundcomparisons src
fi
# Checking config.php existance:
if [ ! -f $dir/src/config.php ]; then
  echo "config.php missing, generating it…"
  cd $dir/src
  source $dir/../secrets/secrets.sh
  # Resetting dir bc source may change it.
  dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  cp config_example.php config.php
  sed -i.bak "s/'server' => 'localhost'/'server' => 'mariadb'/" config.php
  sed -i.bak "s/, 'passwd' => '1234'/, 'passwd' => '$secretMariaDB'/" config.php
  rm config.php.bak
fi
# Checking .htaccess files:
cd $dir
if [ ! -f src/.htaccess ]; then
  echo "src/.htaccess.example -> src/.htaccess"
  sed -e "s/RewriteBase \/shk\/main\//RewriteBase \//g" src/.htaccess.example > src/.htaccess
fi
if [ ! -f src/export/.htaccess ]; then
  echo "src/export/.htaccess.example -> src/export/.htaccess"
  sed -e "s/RewriteBase \/shk\/main\/export/RewriteBase \/export/g" src/export/.htaccess.example > src/export/.htaccess
fi
if [ ! -f src/query/.htaccess ]; then
  echo "src/query/.htaccess.example -> src/query/.htaccess"
  sed -e "s/RewriteBase \/shk\/main\/query\//RewriteBase \/query\//g" src/query/.htaccess.example > src/query/.htaccess
fi
# Building image:
image="lingdb/sndcomp.php"
docker build -t $image:latest .
