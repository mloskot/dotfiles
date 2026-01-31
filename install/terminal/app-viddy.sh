#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing viddy"

VERSION=$(curl -s "https://api.github.com/repos/sachaos/viddy/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading viddy ${VERSION}"

curl -Lo viddy.tar.gz "https://github.com/sachaos/viddy/releases/download/v${VERSION}/viddy-v${VERSION}-linux-x86_64.tar.gz"
sudo tar -xzf viddy.tar.gz --directory ~/.local/bin viddy
rm -f viddy.tar.gz

installed_cmd="$(command -v viddy)"
installed_ver="$(viddy --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
