#!/bin/bash

os=$(uname)
echo "$os"

if [ "$os" == "Darwin" ]
then
	echo "starting vm for macos host"
#	qemu-system-x86_64 -cdrom debImage.iso -boot menu=on -drive file=bc.img -m 2G -smp 1 -accel hvf -net nic -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::8080-:80 -nographic -virtfs local,path=./,mount_tag=host0,security_model=passthrough,id=host0
#	qemu-system-x86_64 -cdrom debImage.iso -boot menu=on -drive file=bc.img -m 2G -smp 1 -accel hvf -net nic,model=virtio -net user,smb=./,hostfwd=tcp::2222-:22,hostfwd=tcp::8080-:80 -nographic

	qemu-system-x86_64 -cdrom debImage.iso -boot menu=on -drive file=bc.img -m 2G -smp 1 -accel hvf -net nic -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::8080-:80 -nographic

	exit 1
fi

echo "starting vm for linux host"
qemu-system-x86_64 -cdrom debImage.iso -boot menu=on -drive file=bc.img -m 2G -smp 1 -enable-kvm -cpu host -net nic -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::8080-:80 -nographic


