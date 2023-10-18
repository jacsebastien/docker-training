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
