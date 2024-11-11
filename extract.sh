#!/bin/bash

FIRMWARE="A810_FW98529A_1.3.72ww_20231008.bin"

docker build -t ntfwinfo .

RUN="docker run -v .:/opt/code -w /opt/code/original -t ntfwinfo"


function bin_info() {
    $RUN python /opt/ntfwinfo/NTKFWinfo.py -i $FIRMWARE
}


function extract_from_bin() {
    # Extract partitions using Novatek-FW-info utility
    for partition in 5 8 9 11 13; do
        $RUN python /opt/ntfwinfo/NTKFWinfo.py -i $FIRMWARE -u $partition -o ../extracted
    done
}


function extract_cpio() {
    # Extract cpio rootfs partition
    partition=$1
    $RUN mkdir ../extracted/$FIRMWARE-uncomp_partitionID${partition}_cpio
    $RUN cpio -idmv --file ../extracted/$FIRMWARE-uncomp_partitionID${partition} --directory ../extracted/$FIRMWARE-uncomp_partitionID${partition}_cpio
}


function extract_extras() {
    extract_cpio 5
    extract_cpio 8
}


#bin_info
extract_from_bin
extract_extras
