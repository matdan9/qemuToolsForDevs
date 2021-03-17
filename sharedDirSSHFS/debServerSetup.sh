#!/bin/bash
sudo apt-get update && upgrade -y
sudo apt-get install sshfs -y
sudo groupadd fuse
sudo usermod -a -G fuse $USER
echo "you should now relog with this user so the changes takes place"
