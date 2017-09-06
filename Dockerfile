FROM debian:stretch

RUN apt-get update # 20170901
RUN apt-get install -y grub-efi-amd64-bin gdisk dosfstools \
    zip

RUN grub-mkimage -o /root/bootx64.efi -p /efi/boot -O x86_64-efi \
 fat iso9660 part_gpt part_msdos \
 normal boot linux configfile loopback chain \
 efifwsetup efi_gop efi_uga \
 ls search search_label search_fs_uuid search_fs_file \
 gfxterm gfxterm_background gfxterm_menu test all_video loadenv \
 exfat ext2 ntfs btrfs hfsplus udf

ADD grub.cfg /root/grub.cfg
ADD build.sh /root/build.sh

WORKDIR /workspace
VOLUME /workspace
CMD ["/root/build.sh"]
