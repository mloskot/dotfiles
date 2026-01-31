#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/backup.sh"
backup_file ~/.config/fastfetch

source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing fastfetch"

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
[[ ! -L ~/.config/fastfetch ]] && ln -s "${DOTFILES_ROOT}/config/fastfetch" ~/.config/fastfetch || true
