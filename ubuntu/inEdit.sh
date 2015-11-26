#!/bin/bash
# Executed inside the chroot environment, run by mkImage.sh
# mounting stuff inside chroot:
export PATH="/usr/bin:/bin"
mount -t proc none /proc
mount -t sysfs none /sys
mount -t devpts none /dev/pts
# Magic:
echo "Yeehaw!"
mount
bash
# Cleanup:
# TODO clean apt cache and stuff
umount /proc || umount -lf /proc
umount /sys
umount /dev/pts
