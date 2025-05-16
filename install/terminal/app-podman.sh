#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing podman"

VERSION=$(curl -s "https://api.github.com/repos/containers/podman/releases/latest" | grep -Po '"tag_name":\s*"v\K[0-9.]+')
echolog "Downloading podman ${VERSION}"

curl -Lo podman.tar.gz "https://github.com/containers/podman/releases/download/v${VERSION}/podman-remote-static-linux_amd64.tar.gz"
tar -xf podman.tar.gz --directory ~/.local/bin \
  --transform='s/podman-remote-static-linux_amd64/podman/g' \
  --strip-components=1 \
  bin/podman-remote-static-linux_amd64
rm -f podman.tar.gz

podman --version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
