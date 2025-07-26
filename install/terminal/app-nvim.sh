#!/bin/bash
source ~/.dotfiles/backup.sh
backup_file ~/.config/nvim

source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing nvim"

VERSION=$(curl -s "https://api.github.com/repos/neovim/neovim/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading nvim ${VERSION}"

curl -Lo nvim.tar.gz "https://github.com/neovim/neovim/releases/download/v${VERSION}/nvim-linux-x86_64.tar.gz"
sudo rm -rf /opt/nvim
sudo tar -xzf nvim.tar.gz --directory /opt
rm -f nvim.tar.gz

source ~/.bash.d/nvim.sh
installed_cmd="$(command -v nvim)"
installed_ver="$(nvim --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"

echolog "Installing ~/.config/nvim"
[[ ! -L ~/.config/nvim ]] && ln -s ~/.dotfiles/config/nvim ~/.config/nvim || true

echolog "Symlinking vi and vim to nvim"
[[ ! -L ~/.local/bin/vi ]] && ln -s /opt/nvim-linux-x86_64/bin/nvim ~/.local/bin/vi || true
[[ ! -L ~/.local/bin/vim ]] && ln -s /opt/nvim-linux-x86_64/bin/nvim ~/.local/bin/vim || true
