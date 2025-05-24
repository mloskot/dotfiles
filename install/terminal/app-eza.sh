#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing eza"

if ! command -v "eza" &>/dev/null; then
  echolog "Adding apt repository"
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | \
    sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
  sudo rm -f /etc/apt/sources.list.d/gierens.list*
  echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | \
    sudo tee /etc/apt/sources.list.d/gierens.list
  sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list

  sudo apt update -y
  sudo apt install -y eza
fi

echolog "Installed $(which eza) $(fastfetch --version)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
