#!/bin/bash
source ~/.dotfiles/backup.sh
backup_file ~/.config/starship.toml

source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Starship"

curl -sS https://starship.rs/install.sh | sudo sh -s -- --force

installed_cmd="$(command -v starship)"
installed_ver="$(starship --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"

echolog "Installing ~/.config/starship.toml"
[[ ! -L ~/.config/starship.toml ]] && ln -s ~/.dotfiles/config/starship/starship.toml ~/.config/starship.toml || true
