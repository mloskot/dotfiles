#!/bin/bash
set -e

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing atuin"
curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | bash

PATH=$HOME/.atuin/bin
export PATH

atuin --version

echolog "Installing bash-preexec"
curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
