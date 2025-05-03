#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing yq"

VERSION=$(curl -s "https://api.github.com/repos/mikefarah/yq/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
echolog "Downloading yq ${VERSION}"

curl -Lo yq.tar.gz "https://github.com/mikefarah/yq/releases/download/v${VERSION}/yq_linux_amd64.tar.gz"
sudo tar -xf yq.tar.gz -C /usr/local/bin --transform='s/yq_linux_amd64/yq/g'
sudo rm -f yq.tar.gz

yq --version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
