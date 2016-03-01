# container
Several [Docker](https://www.docker.com/) containers for parts of the lingdb projects.

Aims to help with staging and deployment of some lingdb projects.

As described in [soundcomparisons #217](https://github.com/lingdb/soundcomparisons/issues/217),
it became apparant that a container solution would be useful for our project.

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
* [CoBL](../../wiki/cobl)
* [nginx](../../wiki/nginx)
