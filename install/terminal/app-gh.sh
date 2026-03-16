#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

echolog "Installing gh"

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

installed_cmd="$(command -v gh)"
installed_ver="$(gh --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"

echolog "Installing Act extension"
gh extension install https://github.com/nektos/gh-act

echolog "Upgrading all extensions"
gh extension upgrade --all
