#!/bin/bash
set -e
echolog "Installing zoxide"

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

zoxide --version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
