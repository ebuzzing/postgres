#!/bin/sh

# Install local teads-central
docker run --rm -i docker-registry.teads.net/curl:master -sL http://ebzpub.ebuzzing.com/files/teads-central/get.sh | sh - 

IMAGE=$(./teads-central vars image)
HASH=$(./teads-central vars hash)

docker build -t $IMAGE:$HASH 9.6/alpine

docker run $IMAGE:$HASH -V | tail -1 | grep PostgreSQL | grep "9.6"
