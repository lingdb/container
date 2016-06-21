#!/bin/bash
# Using rsync to mirror the servers sound files:
rsync -avz --progress --delete -e ssh lingdb:/srv/container/nginx/sound/ sound/
