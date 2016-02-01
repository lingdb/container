#!/bin/bash
last=$(docker ps -f label=lingdb=postgres -f status=running -n=1 -q)
docker exec -it $last psql -h localhost -U ielexuser ielexdb201510
