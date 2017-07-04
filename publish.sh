#!/bin/sh

set -xe

# Install local teads-central
docker run --rm -i docker-registry.teads.net/curl:master -sL http://ebzpub.ebuzzing.com/files/teads-central/get.sh | sh - 

IMAGE=$(./teads-central vars image)

./teads-central docker tag-and-push --image $IMAGE --custom-tags 9.6
