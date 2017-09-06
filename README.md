# Pendrive

Create EFI bootable USB.

## Install

1. `make ethjar.zip`
1. Format USB to fat32
1. Extract ethjar.zip onto root of USB
1. Copy stock ISO image onto iso subdir
1. Make sure that ISO filename matches entry in efi/boot/grub.cfg 