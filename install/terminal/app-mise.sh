#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing mise"

VERSION=$(curl -s "https://api.github.com/repos/jdx/mise/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading mise ${VERSION}"

curl https://mise.run | sh

installed_cmd="$(command -v mise)"
installed_ver="$(mise --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
