#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing SOPS CLI"

VERSION=$(curl -s "https://api.github.com/repos/getsops/sops/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading SOPS ${VERSION}"

curl -Lo sops.deb "https://github.com/getsops/sops/releases/download/v${VERSION}/sops_${VERSION}_amd64.deb"
sudo dpkg -i sops.deb
rm -f sops.deb

installed_cmd="$(command -v sops)"
installed_ver="$(sops --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
