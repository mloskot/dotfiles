#!/bin/bash
set -e

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

VERSION=$(curl -s "https://api.github.com/repos/zellij-org/zellij/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
echolog "Installing zellij ${VERSION}"

curl -LO "https://github.com/zellij-org/zellij/releases/download/v${VERSION}/zellij-x86_64-unknown-linux-musl.tar.gz"
sudo tar xf zellij-x86_64-unknown-linux-musl.tar.gz -C /usr/local/bin zellij
rm -f zellij-x86_64-unknown-linux-musl.tar.gz

zellij --version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
