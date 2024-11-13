#!/bin/bash -e

FIRMWARE="A810_FW98529A_1.5.93ww_20240724.bin"

docker build -t ntfwinfo -f src/Dockerfile.extract src

RUN="docker run -v .:/opt/code -w /opt/code -t ntfwinfo"

EXTRACT_DIR=extracted
CUSTOMIZE_WORKDIR=.customize
