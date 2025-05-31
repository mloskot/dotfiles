#!/bin/bash
set -e
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing atuin"

curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | bash

PATH=$HOME/.atuin/bin:$PATH
export PATH

echolog "Installed $(which atuin) $(atuin --version)"

echolog "Installing bash-preexec"
curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
