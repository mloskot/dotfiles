#!/bin/bash
set -e
echolog "Installing sesh"

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

VERSION=$(curl -s "https://api.github.com/repos/joshmedeski/sesh/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
echolog "Downloading sesh ${VERSION}"

curl -Lo sesh.tar.gz "https://github.com/joshmedeski/sesh/releases/download/v${VERSION}/sesh_Linux_x86_64.tar.gz"
sudo tar -xzf sesh.tar.gz --directory /usr/local/bin sesh
sudo rm -f sesh.tar.gz

echolog "Installed $(which sesh) $(sesh --version)"

echolog "Installing ~/.config/sesh"
[[ ! -L ~/.config/sesh ]] && ln -s ~/.dotfiles/config/sesh ~/.config/sesh

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
