#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing dtop"

VERSION=$(curl -s "https://api.github.com/repos/amir20/dtop/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading dtop ${VERSION}"

INSTALL_DIR=~/.local/bin
export INSTALL_DIR
curl https://raw.githubusercontent.com/amir20/dtop/refs/heads/master/scripts/install.sh | bash
export -n INSTALL_DIR

installed_cmd="$(command -v dtop)"
installed_ver="$(dtop --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
