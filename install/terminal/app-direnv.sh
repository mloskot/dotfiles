#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing direnv"

VERSION=$(curl -s "https://api.github.com/repos/direnv/direnv/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading direnv ${VERSION}"

export bin_path=/usr/local/bin
curl -sfL https://direnv.net/install.sh | sudo bash
unset bin_path

installed_cmd="$(command -v direnv)"
installed_ver="$(direnv --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
