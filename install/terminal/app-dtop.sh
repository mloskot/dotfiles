#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing dtop"

VERSION=$(curl -s "https://api.github.com/repos/amir20/dtop/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading dtop ${VERSION}"

curl --proto '=https' --tlsv1.2 -LsSf https://github.com/amir20/dtop/releases/latest/download/dtop-installer.sh | sh

installed_cmd="$(command -v dtop)"
installed_ver="$(dtop --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
