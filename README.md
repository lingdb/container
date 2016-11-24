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

## Run CoBL standalone:
To run a CoBL instance without a database dump and without the nginx and sndcomp dependencies on the side:

1. Install `docker` and `docker-compose` and `pwgen`. `pwgen` will be used by `secrets/secrets.sh` which is called by`withCompose.sh` to generate database passwords.
2. Clone this repository
3. Issue `git submodule init` and `git submodule update --recursive` to have all repository data checked out correctly.
4. Use the `pull.sh` and `build.sh` scripts to ensure containers are available and up to date.
5. Use `./withCompose.sh up -d postgres` to let the `lingdb_postgres` service run in the background.
6. Use `./withCompose.sh up cobl_debug` to let the `CoBL` service run in a terminal.
This will go trough some phases of setting up the database before the service will finally start up.
Once service startup is completed CoBL will be available on the host at `0.0.0.0:80`.

It is possible to rebuild the `lingdb/cobl` and `lingdb/cobl_debug` containers dedicated:
```bash
./withCompose build cobl
./withCompose build cobl_debug
```

## Container specific setup:
For information about necessary files and container specific configuration please see the following container specific pages:

* [mariadb](../../wiki/mariadb)
* [postgres](../../wiki/postgres)
* [sndcomp](../../wiki/sndcomp)
* [CoBL](../../wiki/cobl)
* [nginx](../../wiki/nginx)
