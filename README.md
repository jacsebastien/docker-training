# Build a Compose File For a Multi-Container Project

## Instructions

Exercise from lecture [Build a Compose File For a Multi-Container Project](https://www.udemy.com/course/docker-mastery/learn/lecture/6775804#overview).

> Goal: Create a compose config for a local Drupal CMS website
>
> /!\ Since 2020, no version needed in compose files! All 2.x and 3.x features are supported by default without version key.

- Create a `docker-compose.yml` file.
- Use the `drupal:9` image along with the `postgres:14` image.
- Use `ports` to expose Drupal on 8080 (or your preferred port for localhost access).
- Be sure to setup the POSTGRES_PASSWORD environment variable on the postgres service.
- Also note that the postgres official image defaults to user:postgres and database:postgres.
- Walk through the Drupal config steps in browser at `http://localhost:8080`.
- Tip: Drupal setup will assume the database runs on localhost, which is incorrect. You'll need to change it under Advanced settings to the name of the Docker service you gave to postgres.
- Use Docker Hub documentation to figure out the right environment and volume settings.
- Extra Credit: Use volumes to store Drupal unique data.

## Solution

See `docker-compose.yml` file.

In the terminal

- `docker compose up`
- `docker container ls -a` => Show Drupal and Postgres containers running

Navigate to `http://localhost:8080`

At step 4 (DB setup)

- DB name: `postgres`
- User: `postgres`
- Password: value set in `docker-compose.yml` for `POSTGRES_PASSWORD` env variable
- Advanced options
  - Host: postgres container's name retrieved from `docker container ls` command
  - Port number: from `docker container ls`

Once done, go back to the terminal

- `docker compose down` => Will stop and remove the containers but should keep the named volumes
- `docker compose up`

Refresh `http://localhost:8080` => Should keep config from previous setup and should directly show the welcome page

- `docker compose down -v` => Cleanup containers AND named volumes
- `docker image rm <drupal-image-id> <postgres-image-id>`

## Verification

- `docker container ls -a` => nothing
- `docker volume ls` => nothing
- `docker image ls` => nothing
