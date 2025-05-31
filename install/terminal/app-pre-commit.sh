#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing pre-commit"

if ! command -v "pre-commit" &>/dev/null; then
  sudo apt update -y
  sudo apt install -y pipx
  pipx install pre-commit
fi

installed_cmd="$(command -v pre-commit)"
installed_ver="$(pre-commit --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
