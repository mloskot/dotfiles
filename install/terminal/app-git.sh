#!/bin/bash
source ~/.dotfiles/backup.sh
backup_file ~/.gitconfig

source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing git"

if ! command -v "git" &>/dev/null; then
  sudo apt update -y
  sudo apt install -y git
fi

installed_cmd="$(command -v git)"
installed_ver="$(git --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"

echolog "Installing ~/.gitconfig"
[[ ! -L ~/.gitconfig ]] && ln -s ~/.dotfiles/config/git/dot-gitconfig ~/.gitconfig || true
