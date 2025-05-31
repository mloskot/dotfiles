#!/bin/bash
set -e
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing fastfetch"

source ~/.dotfiles/backup.sh
backup_file ~/.config/fastfetch

if ! command -v "fastfetch" &>/dev/null; then
  echolog "Adding apt repository"
  sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
  sudo apt update -y
  sudo apt install -y fastfetch
fi

echolog "Installed $(which fastfetch) $(fastfetch --version)"

echolog "Installing ~/.config/fastfetch"
[[ ! -L ~/.config/fastfetch ]] && ln -s ~/.dotfiles/config/fastfetch ~/.config/fastfetch

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
