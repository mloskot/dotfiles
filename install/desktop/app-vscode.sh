#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/backup.sh"
backup_file ~/.config/Code/User/keybindings.json
backup_file ~/.config/Code/User/settings.json

source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing Visual Studio Code"

if ! command -v "code" &>/dev/null; then
  echolog "Adding apt repository"
  push /tmp
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  sudo rm -f /etc/apt/sources.list.d/vscode.list*
  echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | \
    sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
  rm -f packages.microsoft.gpg
  popd

  sudo apt update -y
  sudo apt install -y code

  # Install default themes and extensions
  #code --install-extension ...
fi

code --version

mkdir -p ~/.config/Code/User

echolog "Installing ~/.config/Code/User/settings.json"
[[ ! -L ~/.config/Code/User/settings.json ]] && ln -s "${DOTFILES_ROOT}/config/vscode/settings.jsonc" ~/.config/Code/User/settings.json || true
echolog "Installing ~/.config/Code/User/keybindings.json"
[[ ! -L ~/.config/Code/User/keybindings.json ]] && ln -s "${DOTFILES_ROOT}/config/vscode/keybindings.jsonc" ~/.config/Code/User/keybindings.json || true
