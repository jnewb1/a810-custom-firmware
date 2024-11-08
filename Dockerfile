FROM python

RUN apt update && apt install -y mtd-utils liblzo2-dev android-sdk-libsparse-utils device-tree-compiler

RUN pip install python-lzo ubi_reader

RUN apt update && apt install -y git

RUN git clone https://github.com/EgorKin/Novatek-FW-info /opt/ntfwinfo
