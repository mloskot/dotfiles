#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing moor"

VERSION=$(curl -s "https://api.github.com/repos/walles/moor/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading moor ${VERSION}"

curl -Lo moor "https://github.com/walles/moor/releases/download/v${VERSION}/moor-v${VERSION}-linux-amd64"
mv moor ~/.local/bin
chmod +x ~/.local/bin/moor

installed_cmd="$(command -v moor)"
installed_ver="$(moor --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
