import argparse
from PIL import Image

parser = argparse.ArgumentParser()

parser.add_argument("image")

args = parser.parse_args()


im = Image.open(args.image)

im_2200 = im.resize((240, 240))

im_2810 = im.rotate(90, expand = 1)
im_2810 = im_2810.resize((480, 640))

im_2200.save("customizations/BootLogo/logo_2200.jpg", dpi=(72,72))
im_2810.save("customizations/BootLogo/logo_2810.jpg", dpi=(96,96))