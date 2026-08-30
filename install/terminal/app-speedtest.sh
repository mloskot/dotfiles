#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing speedtest"

if ! command -v "speedtest" &>/dev/null; then
  echolog "Adding apt repository"
  #curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
  #sudo apt install -y speedtest
fi

installed_cmd="$(command -v speedtest)"
installed_ver="$(speedtest --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
