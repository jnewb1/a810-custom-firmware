import argparse
import pathlib


# Firmware not in a real zip file? use this to extract


parser = argparse.ArgumentParser()

parser.add_argument("zip")

args = parser.parse_args()

OFFSET = 0x1a0 - 0xEC  # from binwalk comparison

ZIP = pathlib.Path(args.zip)
BIN = ZIP.with_suffix(".bin")

BIN.write_bytes(ZIP.read_bytes()[OFFSET:])
