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

### Setup

- `docker container run -d --name nginx -p 80:80 nginx`
- `docker container run -d --name apache -p 8080:80 httpd`
- `docker container run -d --name mysql -p 3306:3306 -e MYSQL_RANDOM_ROOT_PASSWORD=yes mysql`

### Verification

- `docker container logs -f mysql` => look for `GENERATED ROOT PASSWORD`
- `docker container ls -a` => Shows the 3 containers that are running
- `docker image ls` => Shows the 3 auto downloaded images
- `curl localhost` => Shows the Nginx welcome message
- `curl localhost:8080` => Shows the Apache welcome message

### Cleanup

- `docker container stop nginx apache mysql`
- `docker container ls -a` => Shows the 3 containers with status `Exited`
- `docker container rm nginx apache mysql`
- `docker container ls -a` => Shows empty table
- `docker image rm nginx httpd mysql`
- `docker image ls` => Shows empty table
