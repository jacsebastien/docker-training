# Using Containers for CLI Testing

## Instructions

Exercise from lecture [Using Containers for CLI Testing](https://www.udemy.com/course/docker-mastery/learn/lecture/6758368#overview).

- Use different Linux disto containers and check `curl` cli tool version.
- Use two different terminal windows to start bash in both `centos:7` and `ubuntu:14.04`, using `-it`.
- Learn the `docker container --rm` option so you can avoid manual cleanup.
- Ensure `curl` is installed and on atest version for each disto.
  - Ubuntu: `apt-get update && apt-get install curl`.
  - CentOS: `yum update curl`.
- Check `curl --version`.

## Solution

Commands I ran into the terminal to do the exercise

In first terminal tab

- `docker container run -it --rm centos:7 bash`
- `yum update curl` => Had to confirm the installation twice
- `curl --version`
- `exit` => Stop the container

In second terminal tab

- `docker container run -it --rm ubuntu:14.04 bash`
- `apt-get update && apt-get install curl` => Had to confirm the installation once
- `curl --version`
- `exit` => Stop the container

In any terminal tab

- `docker container ls -a` => Shows an empty table
- `docker image ls` => Shows `centos:7` and `ubuntu:14.04`
- `docker image rm centos:7 ubuntu:14.04`
- `docker image ls` => Doesn't show `centos:7` and `ubuntu:14.04` anymore
