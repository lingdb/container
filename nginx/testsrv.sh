#!/bin/bash
# To test if nginx listening works correctly.
# https://stackoverflow.com/a/19139134/448591
while true
do echo -e "HTTP/1.1 200 OK\n\n $(date)" | nc -l localhost 5000
done
