#!/bin/bash


docker buildx create --name a810_builder

docker buildx --builder a810_uilder build -t a810-builder . --platform=linux/arm64 --load --progress=plain

docker run -v .:/opt/code --rm --privileged -it a810-builder bash
