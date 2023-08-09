# get ubuntu
FROM ubuntu:latest

# set env
ENV DOCKER_HOST=unix:///var/run/docker.sock

# install git
RUN apt-get update && apt-get install -y git

# install docker
RUN apt-get install -y docker.io

# install docker-compose
RUN apt-get install -y docker-compose

# set working directory
WORKDIR /app

# clone the repo
RUN ["git", "clone", "https://github.com/overleaf/toolkit.git", "/app/toolkit"]

# change the working directory
WORKDIR /app/toolkit

# install the toolkit
RUN ["bin/init"]

# run the run script
CMD ["bin/up"]