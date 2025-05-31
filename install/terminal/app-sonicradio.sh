#!/bin/bash
set -e
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing sonicradio"

VERSION=$(curl -s "https://api.github.com/repos/dancnb/sonicradio/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading sonicradio ${VERSION}"

curl -Lo sonicradio.tar.gz "https://github.com/dancnb/sonicradio/releases/download/v${VERSION}/sonicradio_Linux_x86_64.tar.gz"
tar -xzf sonicradio.tar.gz --directory ~/.local/bin sonicradio
rm -f sonicradio.tar.gz

command -v sonicradio # no --version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
