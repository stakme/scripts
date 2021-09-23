#!/usr/bin/env fish

set wd (pwd);
cd $TMPDIR;

mkdir -p ~/.docker/bin;
mkdir -p ~/.docker/cli-plugins;

# docker
# https://docs.docker.com/engine/install/binaries/#install-client-binaries-on-macos
curl -OL https://download.docker.com/mac/static/stable/x86_64/docker-20.10.8.tgz;
tar -xzvf docker-20.10.8.tgz;
rm docker-20.10.8.tgz;
# sudo xattr -rc docker;
mv docker/docker ~/.docker/bin;
mv docker/cli-plugins/* ~/.docker/cli-plugins/;

# docker compose
# https://github.com/docker/compose-cli
curl -OL https://github.com/docker/compose-cli/releases/download/v2.0.0-rc.2/docker-compose-darwin-amd64
chmod +x docker-compose-darwin-amd64;
mv docker-compose-darwin-amd64 ~/.docker/cli-plugins/docker-compose;

cd $wd;
