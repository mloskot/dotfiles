#!/bin/bash
set -e
source ~/.dotfiles/log.sh ${BASH_SOURCE[0]}

echolog "Installing desktop prerequisites..."
pkgs=()
for pkg in "${pkgs[@]}"; do
  if ! command -v "${pkg}" &>/dev/null; then
    echolog "Installing packages: ${pkgs[@]}" 
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install -y "${pkgs[@]}"
    break
  fi
done

# Run desktop installers
for installer in ~/.dotfiles/install/desktop/*.sh
do
  source $installer
done