#!/bin/bash
set -e
echolog "Installing gh"

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

if ! command -v "gh" &>/dev/null; then
  echolog "Adding apt repository"
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | \
  sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
  sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg &&
  sudo rm -f /etc/apt/sources.list.d/github-cli.list*
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | \
    sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
  sudo apt update &&
  sudo apt install -y gh
fi

echolog "Installed $(which gh) $(gh --version)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
