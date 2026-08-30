#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing Azure CLI"

if ! command -v "az" &>/dev/null; then
  echolog "Adding apt repository"
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
fi

installed_cmd="$(command -v az)"
installed_ver="$(az --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
