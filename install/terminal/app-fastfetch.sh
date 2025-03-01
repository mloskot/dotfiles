#!/bin/bash
# Display system information in the terminal

sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
sudo apt update -y
sudo apt install -y fastfetch

if [ -d "$HOME/.config/fastfetch" ]; then
  rm -r "$HOME/.config/fastfetch"
fi

ln -s ~/.dotfiles/config/fastfetch ~/.config/fastfetch
