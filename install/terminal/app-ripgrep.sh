#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing ripgrep"

VERSION=$(curl -s "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading ripgrep ${VERSION}"

curl -Lo ripgrep.deb "https://github.com/BurntSushi/ripgrep/releases/download/${VERSION}/ripgrep_${VERSION}-1_amd64.deb"
sudo dpkg -i ripgrep.deb
rm -f ripgrep.deb

echolog "Installed $(which rg) $(rg --version)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
