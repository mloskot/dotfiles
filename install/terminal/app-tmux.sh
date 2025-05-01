#!/bin/bash
set -e
echolog "Installing tmux"

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

# shellcheck disable=SC1090
source ~/.dotfiles/backup.sh
backup_file ~/.tmux.conf

if ! command -v "tmux" &>/dev/null; then
  sudo apt update -y
  sudo apt install -y tmux
  mkdir -p ~/.tmux/plugins
fi

tmux -V

echolog "Installing ~/.tmux.conf"
[[ ! -L ~/.tmux.conf ]] && ln -s ~/.dotfiles/config/tmux/dot-tmux.conf ~/.tmux.conf

echolog "Installing tmux plugin tpm"
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
