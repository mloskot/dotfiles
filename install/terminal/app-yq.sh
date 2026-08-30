#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing yq"

VERSION=$(curl -s "https://api.github.com/repos/mikefarah/yq/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading yq ${VERSION}"

curl -Lo yq.tar.gz "https://github.com/mikefarah/yq/releases/download/v${VERSION}/yq_linux_amd64.tar.gz"
sudo tar -xzf yq.tar.gz --directory /usr/local/bin --transform='s/yq_linux_amd64/yq/g'
rm -f yq.tar.gz

installed_cmd="$(command -v yq)"
installed_ver="$(yq --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
