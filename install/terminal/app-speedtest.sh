#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing speedtest"

if ! command -v "speedtest" &>/dev/null; then
  echolog "Adding apt repository"
  #curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
  #sudo apt install -y speedtest
fi

installed_cmd="$(command -v speedtest)"
installed_ver="$(speedtest --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
