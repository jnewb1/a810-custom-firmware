# 70mai A810 Dashcam firmware customizations


Disclaimer: This software is provided "as is," with no warranties or guarantees. The author(s) are not responsible for any damage, data loss, or legal violations resulting from its use.


|  Rear   |  Front |
| :------: | :-----: |
| [![a810_front](docs/810_front.webp)](https://70mai.store/products/dash-cam-a810) | [![a810_rear](docs/810_rear.webp)](https://70mai.store/products/dash-cam-a810) |


`A810_FW98529A_1.3.72ww_20231008.bin`
```
NVTPACK_FW_HDR2 found
NVTPACK_FW_HDR2_VERSION found
Found 9 partitions
Firmware file size 54,835,884 bytes
Firmware file ORIG_CRC:0xB431 CALC_CRC:0xB431
 -------------------------------------------------- PARTITIONS INFO ---------------------------------------------------
|  ID   NAME            START_OFFSET  END_OFFSET         SIZE       ORIG_CRC   CALC_CRC              TYPE              |
 ----------------------------------------------------------------------------------------------------------------------
   1    fdt              0x000000EC - 0x0000576A          22,142     0x0000     0x0000     device tree blob (dtb)
   2    fdt.restore      0x0000576C - 0x0000ADEA          22,142     0x0000     0x0000     device tree blob (dtb)
   3    uboot            0x0000ADEC - 0x00100670       1,005,700     0x0755     0x0755     uboot
   5    kernel           0x001006AC - 0x00327E40       2,258,836     0xF3F7     0xF3F7     BCL1, ZLIB 7,556,917 packed to 2,258,820 bytes
   8    rootfs           0x00327E6C - 0x007DB0E8       4,928,124     0xF1CD     0xF1CD     CKSM<--BCL1, ZLIB 12,923,392 packed to 4,928,044 bytes
   9    app              0x007DB0EC - 0x018DB12C      17,825,856     0xAE14     0xAE14     CKSM<--UBI "app"
  11    rootfs1          0x018DB12C - 0x0337B16C      27,918,400     0x79DF     0x79DF     CKSM<--UBI "rootfs"
  12    rtos             0x0337B16C - 0x0344B9E4         854,136     0x0000     0x0000     unknown part
  13    fdt.app          0x0344B9EC - 0x0344BA72             134     0x0000     0x0000     device tree blob (dtb)
 ----------------------------------------------------------------------------------------------------------------------
<<<<<<< HEAD
```

|  Partition Name   |  Type  |  Description |
| :------: | :-----: |
|  rootfs | cpio | root file system, lots of libraries |
|  app    | ubi  | contains AI models, boot logos, sounds |
|  rootfs1 | ubi | more root file system stuff |
=======
 ```

```
Unzip and paste the firmware in the root of the SD card.
Make sure the device is completely off.
Insert the SD card.
Press and hold the button 4 (most right) and power button and plug in USB cable.
The device will start updating.
```
>>>>>>> 4bd92d87383a83e788cb25f1f4232ffc7a8107fe
