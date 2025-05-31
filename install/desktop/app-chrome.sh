#!/bin/bash
set -e
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Google Chrome"

if ! command -v "chrome" &>/dev/null; then
  echolog "Adding apt repository"
  cd /tmp
  curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install -y ./google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb
  cd -
fi

#xdg-settings set default-web-browser google-chrome.desktop

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
