#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing lazygit"

# shellcheck disable=SC1090
source ~/.dotfiles/backup.sh
backup_file ~/.config/lazygit/config.yml

VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
echolog "Downloading lazygit ${VERSION}"

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${VERSION}_Linux_x86_64.tar.gz"
sudo tar -xzf lazygit.tar.gz --directory /usr/local/bin lazygit
sudo rm -f lazygit.tar.gz

lazygit --version

echolog "Installing ~/.config/lazygit/config.yml"
mkdir -p ~/.config/lazygit
[[ ! -L ~/.config/lazygit/config.yml ]] && ln -s ~/.dotfiles/config/lazygit/config.yml ~/.config/lazygit/config.yml

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
