#!/bin/bash
echo "Forwarding CoBL startup to stage2."
(cd stage2 && ./run.sh)
