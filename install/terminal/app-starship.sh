#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Starship"

# shellcheck disable=SC1090
source ~/.dotfiles/backup.sh
backup_file ~/.config/starship.toml

curl -sS https://starship.rs/install.sh | sudo sh -s -- --force

echolog "Installed $(which starship) $(starship --version)"

echolog "Installing ~/.config/starship.toml"
[[ ! -L ~/.config/starship.toml ]] && ln -s ~/.dotfiles/config/starship/starship.toml ~/.config/starship.toml

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
