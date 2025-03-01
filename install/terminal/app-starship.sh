#!/bin/bash
set -e
source ~/.dotfiles/log.sh ${BASH_SOURCE[0]}

source ~/.dotfiles/backup.sh
backup_file ~/.config/starship.toml 

echolog "Installing starship"
curl -sS https://starship.rs/install.sh | sudo sh -s -- --force

echolog "Installing ~/.config/starship.toml"
ln -s ~/.dotfiles/config/starship/starship.toml ~/.config/starship.toml

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
