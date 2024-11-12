#!/bin/bash

source src/common.sh

APP_PART=9
APP_DIR=997146770

function apply_customizations() {
    rm -r .workdir
    mkdir .workdir
    cp -r extracted/* .workdir
    cp -r customizations/app/* .workdir/$FIRMWARE-uncomp_partitionID$APP_PART/$APP_DIR/app
}

function pack_app() {
   $RUN /bin/bash -c "cp original/$FIRMWARE customized/ && \
        pushd customized && \
        python /opt/ntfwinfo/NTKFWinfo.py -i $FIRMWARE -c $APP_PART -o ../.workdir"
}


apply_customizations
pack_app