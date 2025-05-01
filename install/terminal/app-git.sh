#!/bin/bash
set -e
echolog "Installing git"

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

# shellcheck disable=SC1090
source ~/.dotfiles/backup.sh
backup_file ~/.gitconfig

if ! command -v "git" &>/dev/null; then
  sudo apt update -y
  sudo apt install -y git
fi

git --version

echolog "Installing ~/.gitconfig"
[[ ! -L ~/.gitconfig ]] && ln -s ~/.dotfiles/config/git/dot-gitconfig ~/.gitconfig

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
