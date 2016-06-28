#!/bin/bash
# Switch into container/nginx:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
cd ../nginx
# Start sndcomp container from container/nginx:
last=$(docker ps -f "label=lingdb=mariadb" -f status=running -n=1 -q)
image="lingdb/sndcomp.php"
name="lingdb_sndcomp_php_$(date -I)_$(pwgen 5 1)"
if [ -z "$last" ]; then
  echo "Not starting $image because lingdb_mariadb isn't running."
else
  case $1 in
    export)
      echo "Running $image against $last to export…"
      mapnik=$(docker ps -f "label=lingdb=mapnik" -f status=running -n=1 -q)
      if [ -z "$mapnik" ]; then
        echo "Not starting $image for export because mapnik isn't running."
      else
        docker run --link $last:mariadb \
                   --link $mapnik:mapnik \
                   --name $name \
                   -v `pwd`/../sndcomp.php/src:/var/www/html \
                   -v `pwd`/sound:/var/www/html/sound \
                   -e EXPORT_TASK=$2 \
                   -e DEPLOYED=true \
                   -d $image
        current=$(docker ps -f label=lingdb=sndcomp.php -f status=running -n=1 -q)
        docker exec -it $current /usr/local/bin/php -f /var/www/html/script/generateOffline.php
      fi
    ;;
    test)
      echo "Testing $image against $last…"
      docker run --link $last:mariadb \
                 --name $name \
                 -v `pwd`/../sndcomp.php/src:/var/www/html \
                 -v `pwd`/sound:/var/www/html/sound \
                 -d $image
    ;;
    *)
      echo "Running $image against $last…"
      docker run --link $last:mariadb \
                 --name $name \
                 -v `pwd`/sound:/var/www/html/sound \
                 -e DEPLOYED=true \
                 -d $image
    ;;
  esac
fi
