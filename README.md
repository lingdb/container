# container
A [Vagrant](https://www.vagrantup.com) container with [docker](https://www.docker.com/) containers inside of it.

Aims to help with staging and deployment of some lingdb projects.

As described in [soundcomparisons #217](https://github.com/lingdb/soundcomparisons/issues/217),
it became apparant that a container solution would be useful for our project.

## Vagrant setup:
Since Docker depends on the linux kernel to be used it makes sense to have a Vagrant container for non linux machines to use.
For Vagrant these steps are necessary:

1. Install Vagrant
2. Clone this repository
3. Provide necessary files
4. `vagrant up`
5. Use `vagrant ssh` to complete Docker setup.

## Docker setup:
If you're running linux you don't require the Vagrant setup, but can instead start with Docker directly.
To do so these steps are necessary:

1. Install docker
2. Clone this repository
3. Provide necessary files
4. Execute `pullBaseImages.sh`
5. Execute `buildContainers.sh`

## Container specific setup:
For information about necessary files and container specific configuration please see the following container specific pages:

* mariadb
* postgres
* sndcomp
* ielex2
* nginx
