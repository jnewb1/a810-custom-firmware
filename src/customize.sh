#!/bin/bash

source src/common.sh

cp -r customizations/* extracted/$FIRMWARE-uncomp_partitionID9/997146770/app


function pack_app() {
   $RUN cp original/$FIRMWARE customized/

   $RUN python /opt/ntfwinfo/NTKFWinfo.py -i customized/$FIRMWARE -c 9 -o extracted
}


pack_app