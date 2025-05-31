#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
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

installed_cmd="$(command -v fastfetch)"
installed_ver="$(fastfetch --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"

echolog "Installing ~/.config/fastfetch"
[[ ! -L ~/.config/fastfetch ]] && ln -s ~/.dotfiles/config/fastfetch ~/.config/fastfetch
