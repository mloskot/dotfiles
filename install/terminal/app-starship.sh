#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/backup.sh"
backup_file ~/.config/starship.toml

source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing Starship"

curl -sS https://starship.rs/install.sh | sudo sh -s -- --force

installed_cmd="$(command -v starship)"
installed_ver="$(starship --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"

echolog "Installing ~/.config/starship.toml"
[[ ! -L ~/.config/starship.toml ]] && ln -s "${DOTFILES_ROOT}/config/starship/starship.toml" ~/.config/starship.toml || true
