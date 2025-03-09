#!/bin/bash
set -e
source ~/.dotfiles/log.sh ${BASH_SOURCE[0]}

echolog "Installing terminal tools..."

pkgs=(curl git unzip)
for pkg in "${pkgs[@]}"; do
  if ! command -v "${pkg}" &>/dev/null; then
    echolog "Installing packages: ${pkgs[@]}" 
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install -y "${pkgs[@]}"
    break
  fi
done

# Run terminal installers
for installer in ~/.dotfiles/install/terminal/*.sh
do
  source $installer
done