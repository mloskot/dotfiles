#!/bin/bash
set -e

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

if ! command -v "az" &>/dev/null; then
  echolog "Installing Azure CLI"
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
fi

az --version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
