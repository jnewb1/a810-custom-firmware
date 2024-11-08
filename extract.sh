#!/bin/bash

FIRMWARE="A810_FW98529A_1.3.72ww_20231008.bin"

docker build -t ntfwinfo .

for partition in 8 9 11; do
    docker run -v .:/opt/code -w /opt/code/original -t ntfwinfo python /opt/ntfwinfo/NTKFWinfo.py -i A810_FW98529A_1.3.72ww_20231008.bin -u 9 -o ../extracted
done