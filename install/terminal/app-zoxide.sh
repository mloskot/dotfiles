#!/bin/bash
set -e
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing zoxide"

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

echolog "Installed $(which zoxide) $(zoxide --version)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
