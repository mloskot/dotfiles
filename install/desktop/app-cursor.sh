#!/bin/bash
SCRIPT_NAME="${BASH_SOURCE[0]}"
SCRIPT_PATH="$(dirname "$(realpath "${SCRIPT_NAME}")")"
source "${SCRIPT_PATH}/../../err.sh" "${SCRIPT_NAME}"
source "${SCRIPT_PATH}/../../log.sh" "${SCRIPT_NAME}"

CURSOR_BOOTSTRAP_VERSION="2.4"

echolog "Installing Cursor"

if command -v "cursor" &>/dev/null; then
  echolog "Cursor already installed"
else
  curl -Lo cursor.deb "https://api2.cursor.sh/updates/download/golden/linux-x64-deb/cursor/${CURSOR_BOOTSTRAP_VERSION}"
  sudo dpkg -i cursor.deb
  rm -f cursor.deb
fi

mkdir -p ~/.config/Cursor/User

source "${SCRIPT_PATH}/../../backup.sh" "${SCRIPT_NAME}"
backup_file ~/.config/Code/Cursor/keybindings.json
backup_file ~/.config/Code/Cursor/settings.json

echolog "Installing ~/.config/Cursor/User/settings.json"
[[ ! -L ~/.config/Cursor/User/settings.json ]] && ln -s ~/.dotfiles/config/cursor/settings.jsonc ~/.config/Cursor/User/settings.json || true
echolog "Installing ~/.config/Cursor/User/keybindings.json"
[[ ! -L ~/.config/Cursor/User/keybindings.json ]] && ln -s ~/.dotfiles/config/cursor/keybindings.jsonc ~/.config/Cursor/User/keybindings.json || true
