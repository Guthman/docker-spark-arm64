#!/bin/bash

export DOCKER_DEFAULT_PLATFORM=linux/arm64
export DOCKER_BUILDKIT=1

cd "$HOME"/docker-spark-arm64/ || return
cp docker-compose.yml ./3/debian-10
cd 3/debian-10 || return

docker buildx build -t guthman_arm64/spark:3.1.2 .
docker-compose up
# docker-compose up -d
