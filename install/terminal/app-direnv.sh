#!/bin/bash
set -e

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

VERSION=$(curl -s "https://api.github.com/repos/direnv/direnv/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
echolog "Installing direnv ${VERSION}"

export bin_path=/usr/local/bin
curl -sfL https://direnv.net/install.sh | sudo bash
unset bin_path

direnv --version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
