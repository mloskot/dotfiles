#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing bat"

VERSION=$(curl -s "https://api.github.com/repos/sharkdp/bat/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading bat ${VERSION}"

curl -Lo bat.deb "https://github.com/sharkdp/bat/releases/download/v${VERSION}/bat_${VERSION}_amd64.deb"
sudo dpkg -i bat.deb
rm -f bat.deb

installed_cmd="$(command -v bat)"
installed_ver="$(bat --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
