#!/bin/bash

FIRMWARE="A810_FW98529A_1.3.72ww_20231008.bin"

rm -r original/_$FIRMWARE.extracted

binwalk --run-as=root original/$FIRMWARE -e
binwalk --run-as=root original/_$FIRMWARE.extracted/1006BC -e

mkdir extracted
pushd extracted

mkdir 327EBC
pushd 327EBC

cpio -idmv --file ../../original/_$FIRMWARE.extracted/327EBC

popd


mkdir 1006BC
pushd 1006BC

cpio -idmv --file ../../original/_$FIRMWARE.extracted/_1006BC.extracted/626610.cpio 

popd

popd
