#!/bin/bash
set -e

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

VERSION=$(curl -s "https://api.github.com/repos/junegunn/fzf/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
echolog "Installing fzf ${VERSION}"

curl -Lo fzf.tar.gz "https://github.com/junegunn/fzf/releases/download/v${VERSION}/fzf-${VERSION}-linux_amd64.tar.gz"
sudo tar xf fzf.tar.gz -C /usr/local/bin fzf
rm -f fzf.tar.gz

fzf --version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
