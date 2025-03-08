#!/bin/bash
# Display system information in the terminal

if [[ ! -L "~/.config/fastfetch" && ! -d "~/.config/fastfetch.original" ]]; then
  mv ~/.config/fastfetch ~/.config/fastfetch.original
fi

if [[ ! -L ~/.config/fastfetch ]]; then

  sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
  sudo apt update -y
  sudo apt install -y fastfetch

  echolog "Installing ~/.config/fastfetch"
  ln -s ~/.dotfiles/config/fastfetch ~/.config/fastfetch
fi

