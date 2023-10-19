# DNS Round Robin Test

## Instructions

Exercise from lecture [DNS Round Robin Test](https://www.udemy.com/course/docker-mastery/learn/lecture/6763932#overview).

> /!\ `elasticsearch:2` is old, but it was simple to run on `x86_64` machines and will do the job fine for this exercise.
> However, this old version doesn't have an `arm64` build (M1, M2, Apple Silicon, Raspberry Pi, etc.).
>
> If ran on a `arm64` machine, install a newer version of `elasticsearch` and check the [Elasticsearch](#elasticsearch) section.

> Even since **Docker Engine 1.11**, we can have multiple containers on a created network respond to the same DNS address.

- Create a new virtual network with default bridge driver.
- Create two containers from `elasticsearch:2` image.
- Research in doc and use `--network-alias` when creating the containers to give them additional DNS name (`search`) to respond to.
- Create a `alpine` container on the same network
  - Run `nslookup search` to see the two Elasticsearch containers with the same DNS name
  - Install `curl` (`apk add curl`)
  - Run `curl search:9200` multiple times until you see both "name" fields

### Elasticsearch version

If you use a more updated version of elasticsearch, you'll have to set memory requirements and change some default environment variables to make it work as a simple single container.

Remember you'll also want to change the network and alias for this assignment, but you can add the `-e` options similar to this: `-e "discovery.type=single-node" -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" -e "xpack.security.enabled=false"`.

You'll notice the new elasticsearch no longer has random `cluster_name`, so you'll need to look at `cluster_uuid` to tell them apart.

## Solution

Commands I ran into the terminal to do the exercise

- `docker network create dns_round_robin`
- `docker network ls` => Shows the new `dns_round_robin` network with `bridge` driver in the list
- `docker container run -d --network dns_round_robin --network-alias search elasticsearch:2`
- `docker container run -d --network dns_round_robin --network-alias search elasticsearch:2`
- `docker container ls` => Shows the 2 elasticsearch containers with exposed ports `9200` and random names
- `docker container run -it --rm --network dns_round_robin alpine sh`
- `nslookup search` => Shows 2 different ip addresses with the same DNS name
- `apk update`
- `apk add curl`
- `curl search:9200`
- `exit`
- Stop all containers + remove them and cleanup remaining images.
