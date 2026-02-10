#!/bin/bash
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

PATH=$HOME/.local/bin:$PATH
export PATH

echolog "Installing terminal prerequisites..."
sudo apt update -y
sudo apt upgrade -y

pkgs=(apt-transport-https ca-certificates curl git git-lfs gnupg shellcheck unzip)
for pkg in "${pkgs[@]}"; do
  # If any of required tools is missing, install (or upgrade) all
  if ! command -v "${pkg}" &>/dev/null; then
    echolog "Installing packages: ${pkgs[*]}"
    sudo apt install -y "${pkgs[@]}"
    break
  fi
done

# Run terminal installers
echolog "Installing terminal applications..."

for installer in "${DOTFILES_ROOT}/install/terminal/"*.sh
do
  source "$installer" && status=$? || status=$?; true
  if [[ $status -eq 0 ]]; then
    DOTFILES_INSTALL_SUCCESS="${DOTFILES_INSTALL_SUCCESS} $installer"
  else
    echoerr "Running $installer failed"
    DOTFILES_INSTALL_FAILURE="${DOTFILES_INSTALL_FAILURE} $installer"
  fi
done

# Restore environment after previous source-ing to avoid confusing logs
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

if [[ -z "${DOTFILES_INSTALL_SH}" ]]; then
  echolog "Successful installers: ${DOTFILES_INSTALL_SUCCESS}"
  echolog "Failed installers: ${DOTFILES_INSTALL_FAILURE}"
fi
