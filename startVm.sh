#!/bin/bash

os=$(uname)
echo "You are running $os"
FILE=./bc.imb
	

if [ "$os" == "Darwin" ]
then
	if [[ -f "$FILE" ]]; then
		echo "VM is not installed for this OS yet working on it"
		./devSetup.sh
		echo "applying patch for mac acceleration"
		./macOsPatch.sh
	fi
	echo "starting vm for macos host"
	qemu-system-x86_64 -cdrom debImage.iso -boot menu=on -drive file=bc.img -m 2G -smp 1 -accel hvf -net nic -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::8080-:80 -nographic
	exit 1
fi

if [[ -f "$FILE" ]]; then
	echo "VM is not installed for this OS yet working on it"
	./devSetup.sh
fi
echo "starting vm for linux host"
qemu-system-x86_64 -cdrom debImage.iso -boot menu=on -drive file=bc.img -m 2G -smp 1 -enable-kvm -cpu host -net nic -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::8080-:80 -nographic


