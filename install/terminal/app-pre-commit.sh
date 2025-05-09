#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing pre-commit"

if ! command -v "pre-commit" &>/dev/null; then
  sudo apt update -y
  sudo apt install -y pipx
  pipx install pre-commit
fi

pre-commit --version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
