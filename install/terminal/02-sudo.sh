#!/bin/bash
set -e

source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

if [[ $EUID -gt 0 ]]; then
  echolog "Setting sudo without password for ${USER}"
  echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee "/etc/sudoers.d/$USER-nopasswd"
fi

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
