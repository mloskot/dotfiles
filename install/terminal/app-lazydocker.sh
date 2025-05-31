#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing lazydocker"

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

installed_cmd="$(command -v lazydocker)"
installed_ver="$(lazydocker --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
