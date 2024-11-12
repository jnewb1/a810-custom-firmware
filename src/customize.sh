#!/bin/bash

source src/common.sh

CUSTOMIZE_WORKDIR=.customize

function customize_compressed() {
   name=$1
   partition=$2

   cp -r customizations/$1/* $CUSTOMIZE_WORKDIR/$FIRMWARE-uncomp_partitionID$partition

   $RUN /bin/bash -c "pushd customized && \
        python /opt/ntfwinfo/NTKFWinfo.py -i $FIRMWARE -c $partition -o ../$CUSTOMIZE_WORKDIR"
}


function customize_cpio() {
   name=$1
   partition=$2

   cp -r customizations/$1/* $CUSTOMIZE_WORKDIR/$FIRMWARE-uncomp_partitionID${partition}_cpio

   cpio --create -d -m -v --file $CUSTOMIZE_WORKDIR/$FIRMWARE-uncomp_partitionID${partition} --directory $CUSTOMIZE_WORKDIR/$FIRMWARE-uncomp_partitionID${partition}_cpio

   $RUN /bin/bash -c "pushd customized && \
        python /opt/ntfwinfo/NTKFWinfo.py -i $FIRMWARE -c $partition -o ../$CUSTOMIZE_WORKDIR"
}


cp original/$FIRMWARE customized/

rm -r $CUSTOMIZE_WORKDIR
mkdir $CUSTOMIZE_WORKDIR
cp -r extracted/* $CUSTOMIZE_WORKDIR

customize_compressed app 9
customize_cpio rootfs 8