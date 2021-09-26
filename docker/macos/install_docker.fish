#!/usr/bin/env fish

# docker
# https://docs.docker.com/engine/install/binaries/#install-client-binaries-on-macos
brew install docker;
mkdir -p ~/.docker/cli-plugins;

# docker compose
# https://github.com/docker/compose
curl -L -o ~/.docker/cli-plugins/docker-compose https://github.com/docker/compose/releases/download/v2.0.0-rc.3/docker-compose-darwin-amd64
chmod +x ~/.docker/cli-plugins/docker-compose;

# docker buildx
# https://github.com/docker/buildx
curl -L -o ~/.docker/cli-plugins/docker-buildx https://github.com/docker/buildx/releases/download/v0.6.3/buildx-v0.6.3.darwin-amd64
chmod +x ~/.docker/cli-plugins/docker-buildx;
