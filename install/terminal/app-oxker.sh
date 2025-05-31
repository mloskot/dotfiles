#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing oxker"

curl https://raw.githubusercontent.com/mrjackwills/oxker/main/install.sh | bash

installed_cmd="$(command -v oxker)"
installed_ver="$(oxker --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
