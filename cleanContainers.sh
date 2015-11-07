#!/bin/bash
# A short helper script that removes containers that are no longer running.
docker ps -a -f status=exited -q | xargs docker rm
