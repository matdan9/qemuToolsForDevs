#!/bin/sh

echo "setting up the image for the vm"
qemu-img create -f qcow2 bc.img 10G

echo "downloading debian image"
wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.8.0-amd64-netinst.iso -O debImage.iso

echo "starting vm"
qemu-system-x86_64 -cdrom debImage.iso -boot menu=on -drive file=bc.img -m 2G -smp 1
