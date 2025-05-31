#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing ripgrep"

VERSION=$(curl -s "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading ripgrep ${VERSION}"

curl -Lo ripgrep.deb "https://github.com/BurntSushi/ripgrep/releases/download/${VERSION}/ripgrep_${VERSION}-1_amd64.deb"
sudo dpkg -i ripgrep.deb
rm -f ripgrep.deb

installed_cmd="$(command -v rg)"
installed_ver="$(rg --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
