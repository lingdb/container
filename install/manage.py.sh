#!/bin/bash
# There are several steps necessary to perform with /containerSetup/ielex2/manage.py.
# These steps will be adressed here.
# Execution of this script assumes completed Anaconda setup and user being vagrant.
manage="/containerSetup/ielex2/manage.py"
python2 $manage syncdb
python2 $manage migrate
python2 $manage makemigrations
python2 $manage migrate
