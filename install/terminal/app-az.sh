#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Azure CLI"

if ! command -v "az" &>/dev/null; then
  echolog "Adding apt repository"
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
fi

az --version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
