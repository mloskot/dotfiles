#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing Freelens"

VERSION=$(curl -s "https://api.github.com/repos/freelensapp/freelens/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading Freelens ${VERSION}"
curl -Lo freelens.deb "https://github.com/freelensapp/freelens/releases/download/v${VERSION}/Freelens-${VERSION}-linux-amd64.deb"
sudo dpkg -i freelens.deb
rm -f freelens.deb
