#!/bin/bash
# Required lingdb_sndcomp to be running.
# Parameter $1 must be in all|data|map
docker exec -it lingdb_sndcomp_export env EXPORT_TASK=$1 /usr/local/bin/php -f /var/www/html/script/generateOffline.php
