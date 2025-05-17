#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing speedtest"

if ! command -v "speedtest" &>/dev/null; then
  echolog "Adding apt repository"
  curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
  sudo apt install -y speedtest
fi

echolog "Installed $(which speedtest) $(speedtest --version)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
