#!/bin/bash
mount $1 /mnt
rsync -r --progress src/sndComp_*_export /mnt/
sync
umount /mnt
notify-send 'exportToStick done.'
