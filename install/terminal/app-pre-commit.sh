#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing pre-commit"

if ! command -v "pre-commit" &>/dev/null; then
  sudo apt update -y
  sudo apt install -y pipx
  pipx install pre-commit
fi

installed_cmd="$(command -v pre-commit)"
installed_ver="$(pre-commit --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
