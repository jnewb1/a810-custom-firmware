#!/bin/bash

TAG=a810-builder

docker buildx create --name builder

docker buildx --builder builder build -t $TAG . --platform=linux/arm64 --load --progress=plain

docker run -v .:/opt/code --rm --privileged -it $TAG bash
