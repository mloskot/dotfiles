#!/bin/bash
set -e
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing moar"

VERSION=$(curl -s "https://api.github.com/repos/walles/moar/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading moar ${VERSION}"

curl -Lo moar "https://github.com/walles/moar/releases/download/v${VERSION}/moar-v${VERSION}-linux-amd64"
mv moar ~/.local/bin
chmod +x ~/.local/bin/moar

echolog "Installed $(which moar) $(moar --version)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
