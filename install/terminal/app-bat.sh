#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing bat"

VERSION=$(curl -s "https://api.github.com/repos/sharkdp/bat/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading bat ${VERSION}"

curl -Lo bat.deb "https://github.com/sharkdp/bat/releases/download/v${VERSION}/bat_${VERSION}_amd64.deb"
sudo dpkg -i bat.deb
rm -f bat.deb

echolog "Installed $(which bat) $(bat --version)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
