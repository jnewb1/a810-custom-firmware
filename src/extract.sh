#!/bin/bash -e

source src/common.sh

function bin_info() {
    $RUN python /opt/ntfwinfo/NTKFWinfo.py -i $FIRMWARE
}


function extract_from_bin() {
    partition=$1
    $RUN python /opt/ntfwinfo/NTKFWinfo.py -i $FIRMWARE -u $partition -o ../extracted
}


function extract_cpio() {
    # Extract cpio rootfs partition
    partition=$1
    $RUN mkdir ../extracted/$FIRMWARE-uncomp_partitionID${partition}_cpio
    $RUN cpio -idmv --file ../extracted/$FIRMWARE-uncomp_partitionID${partition} --directory ../extracted/$FIRMWARE-uncomp_partitionID${partition}_cpio
}


function extract_all() {
    pushd original

    for partition in 5 8 9 11 13; do
        extract_from_bin $partition;
    done

    extract_cpio 8

    popd
}

#bin_info
extract_all