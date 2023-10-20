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

Commands I ran into the terminal to do the exercise
