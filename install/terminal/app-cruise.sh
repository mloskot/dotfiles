#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing cruise"

VERSION=$(curl -s "https://api.github.com/repos/NucleoFusion/cruise/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading cruise ${VERSION}"

curl -Lo cruise.deb "https://github.com/NucleoFusion/cruise/releases/download/v${VERSION}/cruise_${VERSION}_linux_amd64.deb"
sudo dpkg -i cruise.deb
rm -f cruise.deb

installed_cmd="$(command -v cruise)"
installed_ver="" # "$(cruise --version)" # FIXME(mloskot): No command
echolog "Installed ${installed_cmd} ${installed_ver}"
