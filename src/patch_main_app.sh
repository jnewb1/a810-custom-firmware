#!/bin/bash

source src/common.sh

SRC=$EXTRACT_DIR/$FIRMWARE-uncomp_partitionID11/2097989931/rootfs/usr/bin/main_app
DST=customizations/rootfs2/2097989931/rootfs/usr/bin/main_app

# These need to have the same number of characters, or maybe we can zero pad them.
WIFI_SSID="changeme00"
WIFI_PASSWORD="changeme"

cp $SRC $DST
sed -i "s/70mai_A810/$WIFI_SSID/g" $DST
sed -i "s/12345678/$WIFI_PASSWORD/g" $DST


size1=$(stat -c%s "$SRC")
size2=$(stat -c%s "$DST")


if [ "$size1" -ne "$size2" ]; then
    echo "wrong file size. $size1 $size2"
    exit 1
fi