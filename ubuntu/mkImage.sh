#!/bin/bash
# Parameters are:
# $1: Relative path to the image to use.
# $2: The device to use for the image.
# Initial setup, image must be given as $1
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
image="$dir/$1"
device="$2"
mount="$dir/mount"
# Copy image to destination:
echo "dd if=$image of=$device"
sudo dd if=$image of=$device
# Mounting device:
echo "mount $device $mount"
sudo mount $device $mount
# FIXME DEBUG
#ls $mount
#sleep 5s
## Clearing mount:
#sync
#sudo umount $dir/mount
