#!/bin/bash


<<<<<<< HEAD
docker buildx create --name agnos_builder

docker buildx --builder agnos_builder build -t agnos-builder . --platform=linux/arm64 --load --progress=plain

docker run -v .:/opt/code --rm --privileged -it agnos-builder bash
=======
docker buildx create --name a810_builder

docker buildx --builder a810_uilder build -t a810-builder . --platform=linux/arm64 --load --progress=plain

docker run -v .:/opt/code --rm --privileged -it a810-builder bash
>>>>>>> 4bd92d87383a83e788cb25f1f4232ffc7a8107fe
