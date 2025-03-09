#!/bin/bash
set -e
source ~/.dotfiles/log.sh ${BASH_SOURCE[0]}

source ~/.dotfiles/backup.sh
backup ~/.config/fastfetch 

if [[ ! -L ~/.config/fastfetch ]]; then
  echolog "Installing fastfetch"
  sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
  sudo apt update -y
  sudo apt install -y fastfetch

  echolog "Installing ~/.config/fastfetch"
  ln -s ~/.dotfiles/config/fastfetch ~/.config/fastfetch
fi

