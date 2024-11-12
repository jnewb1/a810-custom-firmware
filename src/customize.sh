#!/bin/bash -ex

source src/common.sh

CUSTOMIZE_WORKDIR=.customize

function customize_compressed() {
   echo "customize_compressed: $1 ($2)..."
   name=$1
   partition=$2

   cp -r customizations/$1/* $CUSTOMIZE_WORKDIR/$FIRMWARE-uncomp_partitionID$partition

   $RUN /bin/bash -c "pushd customized && \
        python /opt/ntfwinfo/NTKFWinfo.py -i $FIRMWARE -c $partition -o ../$CUSTOMIZE_WORKDIR"
}


function customize_cpio() {
   echo "customize_cpio: $1 ($2)..."
   name=$1
   partition=$2

   cp -r customizations/$1/* $CUSTOMIZE_WORKDIR/$FIRMWARE-uncomp_partitionID${partition}_cpio

   $RUN rm -f $CUSTOMIZE_WORKDIR/$FIRMWARE-uncomp_partitionID${partition}

   $RUN cpio --create -v --file $CUSTOMIZE_WORKDIR/$FIRMWARE-uncomp_partitionID${partition} --directory $CUSTOMIZE_WORKDIR/$FIRMWARE-uncomp_partitionID${partition}_cpio

   $RUN /bin/bash -c "pushd customized && \
        python /opt/ntfwinfo/NTKFWinfo.py -i $FIRMWARE -c $partition -o ../$CUSTOMIZE_WORKDIR"
}


function customize_all() {
    cp original/$FIRMWARE customized/

    rm -r $CUSTOMIZE_WORKDIR
    mkdir $CUSTOMIZE_WORKDIR
    cp -r $EXTRACT_DIR/* $CUSTOMIZE_WORKDIR

    customize_cpio rootfs 8
    customize_compressed app 9
}

customize_all