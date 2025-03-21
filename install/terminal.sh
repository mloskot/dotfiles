#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing terminal prerequisites..."
sudo apt update -y
sudo apt upgrade -y

pkgs=(curl git unzip)
for pkg in "${pkgs[@]}"; do
  # If any of required tools is missing, install (or upgrade) all
  if ! command -v "${pkg}" &>/dev/null; then
    echolog "Installing packages: ${pkgs[*]}"
    sudo apt install -y "${pkgs[@]}"
    break
  fi
done

# Run terminal installers
for installer in ~/.dotfiles/install/terminal/*.sh
do
  # shellcheck disable=SC1090
  source "$installer"
done
