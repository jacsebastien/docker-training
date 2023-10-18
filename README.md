# Edit Code Running In Containers With Bind Mounts

## Instructions

Exercise from lecture [Edit Code Running In Containers With Bind Mounts](https://www.udemy.com/course/docker-mastery/learn/lecture/6775742#overview).

- Use a Jekyll "Static Site Generator" to start a local web server.
- Don't need to install the tools locally or know the tech behind the website, Docker image will contain everything and run the local source code.
- Source code is in the `src` folder.
- Start a container using image `bretfisher/jekyll-serve` with bind mount to the local `src` folder (port `80:4000`).
- Open `localhost:80` to see the website
- Edit files from the `src/_posts` in the host machine via preferred IDE.
- Refresh the browser to see the changes

## Solution

There ate the commands I ran into the terminal to do the exercise
