#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing sesh"

source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

VERSION=$(curl -s "https://api.github.com/repos/joshmedeski/sesh/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading sesh ${VERSION}"

curl -Lo sesh.tar.gz "https://github.com/joshmedeski/sesh/releases/download/v${VERSION}/sesh_Linux_x86_64.tar.gz"
sudo tar -xzf sesh.tar.gz --directory /usr/local/bin sesh
rm -f sesh.tar.gz

installed_cmd="$(command -v sesh)"
installed_ver="$(sesh --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"

echolog "Installing ~/.config/sesh"
[[ ! -L ~/.config/sesh ]] && ln -s ~/.dotfiles/config/sesh ~/.config/sesh
