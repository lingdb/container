# Building a soundcomparisons ISO:

To build an `.iso` file for the soundcomparisons website,
I did the following things:

1. Overwrite the target drive with zeros to make later compression easier to handle.
   This can be done with `dd if=/dev/zero of=$target`.

2. Aquire a recent Ubuntu Image and use `dd` to get a bootable medium.
   Make sure this Medium has at least `8G` of space,
   because the sound files and the containers will take up some space.
