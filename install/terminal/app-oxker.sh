#!/bin/bash
set -e
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing oxker"

curl https://raw.githubusercontent.com/mrjackwills/oxker/main/install.sh | bash

echolog "Installed $(which oxker) $(oxker --version)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
