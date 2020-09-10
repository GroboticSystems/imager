#!/bin/bash

# INSTALL DEPENDENCIES
DEBIAN_FRONTEND="noninteractive" apt install -y ca-certificates git unzip wget qemu-user-static binfmt-support build-essential qemu-user-static ca-certificates dosfstools gdisk kpartx parted libarchive-tools sudo xz-utils psmisc
git clone https://github.com/hashicorp/packer --branch v1.5.5
cd packer
go mod vendor
go get .
go install
cd ..

# INSTALL PACKER-BUILDER-ARM
git clone https://github.com//mkaczanowski/packer-builder-arm/
cd packer-builder-arm
go mod download
go build
sudo cp packer-builder-arm /usr/local/bin
cd ..


# INSTALL PISHRINKK
wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh
chmod +x pishrink.sh
sudo mv pishrink.sh /usr/local/bin
