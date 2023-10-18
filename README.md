# Database Upgrades with Named Volumes

## Instructions

Exercise from lecture [Database Upgrades with Named Volumes](https://www.udemy.com/course/docker-mastery/learn/lecture/6775726#overview).

- Database upgrade with containers
- Create a `postgres` container with a named volume `psql-data` using `postgres:9.6.1`
- Use Docker Hub to learn `VOLUME` path and versions needed to run it
- Check logs, stop container
- Create a new `postgres` container with same named volume using `postgres:9.6.2`
- Check logs to validate
- Cleanup images, containers and volumes

## Solution

Commands I ran into the terminal to do the exercise

- `docker container run -d --name postgres -v psql-data:/var/lib/postgresql/data postgres:9.6.1`
- `docker container ls -a`
- `docker container logs -f postgres` => shows all the initial setup and volume creation, then startup logs
- `docker volume ls` => only shows the named volume `psql-data`
- `docker container stop postgres`
- `docker container run -d --name postgres2 -v psql-data:/var/lib/postgresql/data postgres:9.6.2`
- `docker container logs -f postgres2` => shows only the startup logs because it reuses the config from the existing volume
- `docker volume ls` => still only shows the named volume `psql-data`
- `docker container stop postgres2`
- `docker container prune`
- `docker volume prune`
- `docker image prune`
