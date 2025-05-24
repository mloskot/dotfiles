#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing nvim"

# shellcheck disable=SC1090
source ~/.dotfiles/backup.sh
backup_file ~/.config/nvim

VERSION=$(curl -s "https://api.github.com/repos/neovim/neovim/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading nvim ${VERSION}"

curl -Lo nvim.tar.gz "https://github.com/neovim/neovim/releases/download/v${VERSION}/nvim-linux-x86_64.tar.gz"
sudo rm -rf /opt/nvim
sudo tar -xzf nvim.tar.gz --directory /opt
rm -f nvim.tar.gz

# shellcheck disable=SC1090
source ~/.bash.d/nvim.sh
echolog "Installed $(which nvim) $(nvim --version)"

echolog "Installing ~/.config/nvim"
[[ ! -L ~/.config/nvim ]] && ln -s ~/.dotfiles/config/nvim ~/.config/nvim

echolog "Symlinking vi and vim to nvim"
[[ ! -L ~/.local/bin/vi ]] && ln -s /opt/nvim-linux-x86_64/bin/nvim ~/.local/bin/vi
[[ ! -L ~/.local/bin/vim ]] && ln -s /opt/nvim-linux-x86_64/bin/nvim ~/.local/bin/vim

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
