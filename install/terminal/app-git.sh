#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/backup.sh"
backup_file ~/.gitconfig

source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing git"

if ! command -v "git" &>/dev/null; then
  sudo apt update -y
  sudo apt install -y git
fi

installed_cmd="$(command -v git)"
installed_ver="$(git --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"

echolog "Installing ~/.gitconfig"
[[ ! -L ~/.gitconfig ]] && ln -s "${DOTFILES_ROOT}/config/git/dot-gitconfig" ~/.gitconfig || true
