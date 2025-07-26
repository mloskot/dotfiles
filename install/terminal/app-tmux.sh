#!/bin/bash
source ~/.dotfiles/backup.sh
backup_file ~/.tmux.conf

source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing tmux"

if ! command -v "tmux" &>/dev/null; then
  sudo apt update -y
  sudo apt install -y tmux
  mkdir -p ~/.tmux/plugins
fi

installed_cmd="$(command -v tmux)"
installed_ver="$(tmux -V)"
echolog "Installed ${installed_cmd} ${installed_ver}"

echolog "Installing ~/.tmux.conf"
[[ ! -L ~/.tmux.conf ]] && ln -s ~/.dotfiles/config/tmux/dot-tmux.conf ~/.tmux.conf || true

echolog "Installing tmux plugin manager (tpm)"
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echolog "Installing tmux plugins"
~/.tmux/plugins/tpm/bin/install_plugins
