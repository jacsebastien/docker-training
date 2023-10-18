# Manage Multiple Containers

## Instructions

Exercise from lecture [Manage Multiple Containers](https://www.udemy.com/course/docker-mastery/learn/lecture/6489906#overview).

- docs.docker.com and `--help` are your friends.
- Run a `nginx`, a `mysql` and a `httpd` (apache) server together.
- Run all of them in detached mode and give them a name.
- `nginx` should listen on port `80:80`, `httpd` on `8080:80` and `mysql` on `3306:3306`.
- When running `mysql`, use the env option to define `MYSQL_RANDOM_ROOT_PASSWORD=yes`.
- List containers to be sure everything is fine.
- Show the logs on `mysql` to find the random password created on startup.
- Stop all containers and clean it all up.
- List containers to be sure everything is cleaned up.

## Solution

Commands I ran into the terminal to do the exercise
