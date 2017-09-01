#!/bin/bash
set -e

dd if=/dev/zero of=./ethjar.img bs=1M count=400
mkfs.fat ./ethjar.img
mount -o loop ./ethjar.img /mnt
mkdir -p /mnt/EFI/BOOT/
cp /root/bootx64.efi /mnt/EFI/BOOT/
cp /root/grub.cfg /mnt/EFI/BOOT/
cp /workspace/ethjar.iso /mnt/EFI/BOOT/

umount /mnt
