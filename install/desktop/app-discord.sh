#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Discord"

curl -Lo discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
rm -f discord.deb
