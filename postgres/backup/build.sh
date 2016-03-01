#!/bin/bash
image="lingdb/postgres_backup"
docker build -t $image:latest .
