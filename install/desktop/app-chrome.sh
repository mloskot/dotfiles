#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Google Chrome"

if ! command -v "chrome" &>/dev/null; then
  echolog "Adding apt repository"
  pushd /tmp
  curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install -y ./google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb
  popd
fi

#xdg-settings set default-web-browser google-chrome.desktop
