#!/bin/bash -e

TAG=a810-builder

docker buildx --builder builder build -f src/Dockerfile.compile -t $TAG . --platform=linux/armhf --load --progress=plain

docker run -v .:/opt/code -w /opt/code --rm --privileged -it $TAG bash
