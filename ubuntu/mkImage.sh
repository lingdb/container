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
echo "Extracting data…"
sudo rsync --exclude=/casper/filesystem.squashfs -a $mount/ $extract
sudo unsquashfs $mount/casper/filesystem.squashfs
sudo mv squashfs-root edit
sudo umount $mount
# Preparing chroot:
echo "Preparing chroot…"
sudo cp /etc/resolv.conf edit/etc/
sudo mount -o bind /run/ edit/run
sudo mount --bind /dev/ edit/dev
# Copying stuff for installation:
# TODO solve these:
# 1. Get internet inside chroot
# 2. Cope stuff into chroot
# 3. Run install script inside chroot
# 4. Cleanup inside chroot
# 5. Build image from stuff done inside chroot
sudo cp inEdit.sh edit/
# Doing the chroot:
echo "chroot…"
sudo chroot edit /bin/bash -c /inEdit.sh
# Cleanup for chroot:
sudo umount edit/run
sudo umount edit/dev
#sudo rm -rf edit $extract
