#!/bin/bash -e

source src/common.sh

function bin_info() {
    $RUN python /opt/ntfwinfo/NTKFWinfo.py -i $FIRMWARE
}


function extract_compressed() {
    partition=$1
    $RUN /bin/bash -c "pushd original && \
         python /opt/ntfwinfo/NTKFWinfo.py -i $FIRMWARE -u $partition -o ../$EXTRACT_DIR"
}


function extract_cpio() {
    # Extract cpio rootfs partition
    partition=$1
    $RUN mkdir $EXTRACT_DIR/$FIRMWARE-uncomp_partitionID${partition}_cpio
    $RUN cpio --extract -d -m -v --file $EXTRACT_DIR/$FIRMWARE-uncomp_partitionID${partition} --directory $EXTRACT_DIR/$FIRMWARE-uncomp_partitionID${partition}_cpio
}


function extract_all() {
    $RUN rm -rf $EXTRACT_DIR

    for partition in 5 8 9 11 13; do
        extract_compressed $partition;
    done

    extract_cpio 8
}

#bin_info
extract_all