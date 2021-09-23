#!/usr/bin/env fish

mkdir -p ~/.docker-host;
cd ~/.docker-host;

# utils
brew install qemu gnupg coreutils;

# download Ubuntu
# https://ubuntu.com/tutorials/how-to-verify-ubuntu#1-overview
curl -OL http://releases.ubuntu.com/20.04/ubuntu-20.04.3-live-server-amd64.iso;
curl -OL http://releases.ubuntu.com/20.04/SHA256SUMS;
curl -OL http://releases.ubuntu.com/20.04/SHA256SUMS.gpg;

qemu-img create -f qcow2 ubuntu-server.qimg 10G;
qemu-system-x86_64 \
    -m 4G \
    -vga virtio \
    -display default,show-cursor=on \
    -usb \
    -device usb-tablet \
    -machine type=q35,accel=hvf \
    -smp 2 \
    -cdrom ubuntu-20.04.3-live-server-amd64.iso \
    -drive file=ubuntu-server.qimg,if=virtio \
    -cpu host;
