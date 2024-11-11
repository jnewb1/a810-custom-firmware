#!/bin/bash

export FIRMWARE="A810_FW98529A_1.5.93ww_20240724.bin"

docker build -t ntfwinfo src

RUN="docker run -v .:/opt/code -w /opt/code -t ntfwinfo"
