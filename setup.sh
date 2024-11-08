#!/bin/bash


docker buildx create --name agnos_builder

docker buildx --builder agnos_builder build -t agnos-builder . --platform=linux/arm64 --load --progress=plain

docker run -v .:/opt/code --rm --privileged -it agnos-builder bash