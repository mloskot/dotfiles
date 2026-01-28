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
