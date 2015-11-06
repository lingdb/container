#!/usr/bin/bash
# https://hub.docker.com/_/postgres/
docker run --name lingdb.postgres \
           -e POSTGRES_USER=ielexuser \
           -e POSTGRES_PASSWORD=abcd1234 \
           -d postgres:9.3.10
