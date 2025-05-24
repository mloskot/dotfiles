#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing mise"

VERSION=$(curl -s "https://api.github.com/repos/jdx/mise/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading mise ${VERSION}"

curl https://mise.run | sh

echolog "Installed $(which mise) $(mise --version)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
