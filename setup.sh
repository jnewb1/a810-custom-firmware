#!/bin/bash


docker buildx create --name ***REMOVED***_builder

docker buildx --builder ***REMOVED***_builder build -t ***REMOVED***-builder . --platform=linux/arm64 --load --progress=plain

docker run -v .:/opt/code --rm --privileged -it ***REMOVED***-builder bash