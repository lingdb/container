#!/bin/bash
# https://github.com/lingdb/soundcomparisons/issues/249
# https://help.ubuntu.com/community/LiveCDCustomization
# Parameters are:
# $1: Relative path to the image to use.
# Initial setup, image must be given as $1
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
image="$dir/$1"
mount="$dir/mount"
extract="$dir/extract-cd"
# Creating directories in case they don't exist:
mkdir $mount $extract
# Mounting device:
echo "mount -o loop $image $mount"
sudo mount -o loop $image $mount
# Extracting data:
echo "rsync --exclude=/casper/filesystem.squashfs -a $mount/ $extract"
sudo rsync --exclude=/casper/filesystem.squashfs -a $mount/ $extract
echo "unsquashfs $mount/casper/filesystem.squashfs"
sudo unsquashfs $mount/casper/filesystem.squashfs
sudo mv squashfs-root edit
# FIXME DEBUG
#ls $mount
#sleep 5s
## Clearing mount:
#sync
#sudo umount $dir/mount
