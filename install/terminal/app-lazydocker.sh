#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing lazydocker"

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

echolog "Installed $(which lazydocker) $(lazydocker --version)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
