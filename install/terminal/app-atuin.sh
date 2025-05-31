#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing atuin"

curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | bash

PATH=$HOME/.atuin/bin:$PATH
export PATH

installed_cmd="$(command -v atuin)"
installed_ver="$(atuin --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"

echolog "Installing bash-preexec"
curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh
