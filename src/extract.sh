#!/bin/bash -e

source src/common.sh

function bin_info() {
    $RUN python /opt/ntfwinfo/NTKFWinfo.py -i $FIRMWARE
}


function extract_compressed() {
    partition=$1
    $RUN /bin/bash -c "pushd original && \
         python /opt/ntfwinfo/NTKFWinfo.py -i $FIRMWARE -u $partition -o ../extracted"
}


function extract_cpio() {
    # Extract cpio rootfs partition
    partition=$1
    $RUN mkdir extracted/$FIRMWARE-uncomp_partitionID${partition}_cpio
    $RUN cpio --extract -d -m -v --file extracted/$FIRMWARE-uncomp_partitionID${partition} --directory extracted/$FIRMWARE-uncomp_partitionID${partition}_cpio
}


function extract_all() {
    for partition in 5 8 9 11 13; do
        extract_compressed $partition;
    done

    extract_cpio 8
}

#bin_info
extract_all