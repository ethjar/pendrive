#!/bin/bash
set -e

cd /mnt

mkdir -p efi/boot/
mkdir iso
cp /root/bootx64.efi efi/boot/
cp /root/grub.cfg efi/boot/

dd if=/dev/zero of=./home-rw bs=1M count=100
mkfs.ext3 -F ./home-rw

zip -r /workspace/ethjar.zip .
