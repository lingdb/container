#!/usr/bin/bash
# https://hub.docker.com/_/mariadb/
docker run --name container.mariadb -e MYSQL_ROOT_PASSWORD=1234 -e MYSQL_DATABASE=v5 -d mariadb:latest
