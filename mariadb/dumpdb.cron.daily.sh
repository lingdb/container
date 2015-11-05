#!/bin/bash
# Provisioning will copy this file into /etc/cron.daily
# This file will act as a proxy to /containerSetup/database/dumpdb.sh
/containerSetup/mariadb/dumpdb.sh
