#!/usr/bin/env fish

set -Ux DOCKER_HOST ssh://stakme@localhost:10022

cd ~/.dockerhost;
qemu-system-x86_64 \
    -m 4G \
    -vga virtio \
    -display none \
    -usb \
    -device usb-tablet \
    -machine type=q35,accel=hvf \
    -smp 2 \
    -drive file=ubuntu-server.qimg,if=virtio \
    -cpu host \
    -device virtio-serial \
    -net user,hostfwd=tcp::10022-:22 \
    -net nic \
;
