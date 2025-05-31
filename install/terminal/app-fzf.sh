#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing fzf"

VERSION=$(curl -s "https://api.github.com/repos/junegunn/fzf/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading fzf ${VERSION}"

curl -Lo fzf.tar.gz "https://github.com/junegunn/fzf/releases/download/v${VERSION}/fzf-${VERSION}-linux_amd64.tar.gz"
sudo tar -xzf fzf.tar.gz --directory /usr/local/bin fzf
rm -f fzf.tar.gz

installed_cmd="$(command -v fzf)"
installed_ver="$(fzf --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
