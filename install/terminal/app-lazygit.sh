#!/bin/bash
set -e

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
echolog "Installing lazygit ${VERSION}"

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
sudo rm -f lazygit.tar.gz

lazygit --version

echolog "Installing ~/.config/lazygit"
[[ ! -L ~/.config/lazygit ]] && ln -s ~/.dotfiles/config/lazygit ~/.config/lazygit

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
