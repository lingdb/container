# container
A [Vagrant](https://www.vagrantup.com) container with [docker](https://www.docker.com/) containers inside of it.

Aims to help with staging and deployment of some lingdb projects.

As described in [soundcomparisons #217](https://github.com/lingdb/soundcomparisons/issues/217),
it became apparant that a container solution would be useful for our project.

## Vagrant setup:
Since Docker depends on the linux kernel to be used it makes sense to have a Vagrant container for non linux machines to use.
To be independent of linux one of the Vagrant setups can be used:

* [Vagrant](wiki/vagrant.sndcomp) for the soundcomparisons website.
* [Vagrant](wiki/vagrant.all) for the whole project.

## Docker setup:
If you're running linux you don't require the Vagrant setup, but can instead start with Docker directly.
To do so these steps are necessary:

1. Install docker
2. Clone this repository
3. Provide necessary files
4. Read the wiki entries for the wanted containers
4. Inspect and execute `build.sh`
5. Inspect and execute `run.sh`
6. Perform additional steps as necessary

## Container specific setup:
For information about necessary files and container specific configuration please see the following container specific pages:

* [mariadb](../../wiki/mariadb)
* [postgres](../../wiki/postgres)
* [sndcomp](../../wiki/sndcomp)
* [ielex2](../../wiki/ielex2)
* [nginx](../../wiki/nginx)
