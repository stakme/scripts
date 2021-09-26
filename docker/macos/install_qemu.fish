#!/usr/bin/env fish

# utils
brew install qemu gnupg coreutils;

set dir (cd (dirname (status -f)); and pwd);
mkdir -p ~/.dockerhost/bin;
cd ~/.dockerhost;

# download Ubuntu image
# TODO: https://ubuntu.com/tutorials/how-to-verify-ubuntu#1-overview
if [ -e ~/.dockerhost/ubuntu-server-amd64.iso ]
    echo "ubuntu image exists: not downloaded."
else
    curl -L -o ~/.dockerhost/ubuntu-server-amd64.iso http://releases.ubuntu.com/20.04/ubuntu-20.04.3-live-server-amd64.iso;
end

if [ -e ~/.dockerhost/ubuntu-server.qimg ]
    echo "qemu-img exists: not created."
else
    qemu-img create -f qcow2 ~/.dockerhost/ubuntu-server.qimg 30G;
end

cp $dir/qemu_setup.fish ~/.dockerhost/bin/dockerhost.setup;
cp $dir/qemu_console.fish ~/.dockerhost/bin/dockerhost.console;
cp $dir/qemu_run.fish ~/.dockerhost/bin/dockerhost.run;

which dockerhost.setup;
if [ "$status" = "1" ]
    echo "set PATH \$HOME/.dockerhost/bin \$PATH" >> ~/.config/fish/config.fish;
    source ~/.config/fish/config.fish;
end
