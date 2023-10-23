# Compose For Image Building

## Instructions

Exercise from lecture [Compose For Image Building](https://www.udemy.com/course/docker-mastery/learn/lecture/6775804).

> Goal: This time imagine you're just wanting to learn Drupal's admin and GUI, or maybe you're a software tester and you need to test a new theme for Drupal. When configured properly, this will let you build a custom image and start everything with `docker-compose up` including storing important db and config data in volumes so the site will remember your changes across Compose restarts.

- Use the compose file you created in [7-basic-compose-file](https://github.com/jacsebastien/docker-training/tree/7-basic-compose-file) as a starting point.
- Let's pin image version from Docker Hub this time.
  It's always a good idea to do that so a new major version doesn't surprise you.

## Dockerfile

- First you need to build a custom Dockerfile using `drupal:9` image.
- Then run apt package manager command to install git: `apt-get update && apt-get install -y git`
- Remember to cleanup after your apt install with `rm -rf /var/lib/apt/lists/*` and use `\` and `&&` properly.
  You can find examples of them in drupal official image. More on this below under Compose file.
- Then move to `/var/www/html/themes` and use git to clone the theme with:
  `RUN git clone --branch 8.x-4.x --single-branch --depth 1 https://git.drupalcode.org/project/bootstrap.git`
- Combine that line with this line, as we need to change permissions on files and don't want to
  use another image layer to do that (it creates size bloat).
  This drupal container runs as www-data user but the build actually runs as root,
  so often we have to do things like `chown` to change file owners to the proper user:
  `chown -R www-data:www-data bootstrap`.
- Then, just to be safe, change the working directory back to its default (from drupal image) at `/var/www/html`

## Compose File

- We're going to build a custom image in this compose file for drupal service.
- Rename image to `custom-drupal` as we want to make a new image based on the official `drupal:9`.
- We want to build the default Dockerfile in this directory for the `drupal` service.
- For the db, this time use `mariadb:11.1.2` instead of `postgres`, you'll need to setup the following env variables for that
  - `MARIADB_ROOT_PASSWORD`
  - `MARIADB_DATABASE`
  - `MARIADB_USER`
  - `MARIADB_PASSWORD`
- Also add a volume to store the DB and avoid loosing it's data.

## Start Containers, Configure Drupal

- Start containers like before, configure Drupal web install like before.
- After site comes up, click on `Appearance` in top bar, and notice a new theme called`Bootstrap` is there.
  That's the one we added with our custom Dockerfile.
- Click `Install and set as default`.
  Then click `Back to site` (in top left) and the site interface should look different.
  You've successfully installed and activated a new theme in your own custom image without
  installing anything on your host other than Docker!
- If you exit (ctrl-c) and then `docker compose down` it will delete containers,
  but not the volumes, so on next `docker compose up` everything will be as it was.
- To totally clean up volumes, add `-v` to `down` command.

## Solution

- See `Dockerfile`.
- See `docker-compose.yml` file.

Commands I ran in the terminal
