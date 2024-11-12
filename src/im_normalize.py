"""
The firmware is particular about BootLogo. It needs to be the exact format and not too big.
"""

import argparse
from PIL import Image

parser = argparse.ArgumentParser()

parser.add_argument("image")

args = parser.parse_args()


im = Image.open(args.image).convert('RGB')

assert im.size[0] == im.size[1]

im_2200 = im.resize((240, 240))

im_2810 = im.resize((640, 640))
m = (640 - 480) / 2
im_2810 = im_2810.crop((0, m, 640, 640-m))
im_2810 = im_2810.rotate(90, expand = 1)
im_2810 = im_2810.resize((480, 640))


im_2200.save("customizations/app/BootLogo/logo_2200.jpg", dpi=(72,72), quality=10)
im_2810.save("customizations/app/BootLogo/logo_2810.jpg", dpi=(96,96), quality=10)