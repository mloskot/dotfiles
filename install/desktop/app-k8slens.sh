#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Lens"

if ! command -v "lens-desktop" &>/dev/null; then
  echolog "Adding apt repository"
  cd /tmp
  wget -qO- https://downloads.k8slens.dev/keys/gpg | gpg --dearmor > k8slens.gpg
  sudo install -D -o root -g root -m 644 k8slens.gpg /etc/apt/keyrings/k8slens.gpg
  echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/k8slens.gpg] https://downloads.k8slens.dev/apt/debian stable main" | \
    sudo tee /etc/apt/sources.list.d/k8slens.list > /dev/null
  rm -f k8slens.gpg
  cd -

  sudo apt update -y
  sudo apt install -y lens
fi

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
