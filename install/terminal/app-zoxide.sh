#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing zoxide"

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

installed_cmd="$(command -v zoxide)"
installed_ver="$(zoxide --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
