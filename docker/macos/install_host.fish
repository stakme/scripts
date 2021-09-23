#!/usr/bin/env fish

set dir (cd (dirname (status -f)); and pwd);

# utils
# brew install qemu gnupg coreutils;

mkdir -p ~/.dockerhost/bin;
cd ~/.dockerhost;

# download Ubuntu
# https://ubuntu.com/tutorials/how-to-verify-ubuntu#1-overview
curl -OL http://releases.ubuntu.com/20.04/ubuntu-20.04.3-live-server-amd64.iso;
curl -OL http://releases.ubuntu.com/20.04/SHA256SUMS;
curl -OL http://releases.ubuntu.com/20.04/SHA256SUMS.gpg;

qemu-img create -f qcow2 ubuntu-server.qimg 10G;

cp $dir/qemu_setup.fish ~/.dockerhost/bin/dockerhost.setup;
cp $dir/qemu_run.fish ~/.dockerhost/bin/dockerhost.run;

which dockerhost.setup;
if [ "$status" = "1" ]
    echo "set PATH \$HOME/.dockerhost/bin \$PATH" >> ~/.config/fish/config.fish;
    source ~/.config/fish/config.fish;
end
