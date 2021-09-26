#!/usr/bin/env fish

docker context create dockerhost --docker host=ssh://docker@localhost:10022;
docker context use dockerhost;

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
