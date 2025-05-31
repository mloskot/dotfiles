#!/bin/bash
set -e
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Azure CLI"

if ! command -v "az" &>/dev/null; then
  echolog "Adding apt repository"
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
fi

echolog "Installed $(which az) $(az --version)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
