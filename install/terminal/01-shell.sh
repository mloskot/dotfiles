#!/bin/bash
set -e

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

# shellcheck disable=SC1090
source ~/.dotfiles/backup.sh
backup_file ~/.inputrc

echolog "Installing ~/.inputrc"
[ ! -L ~/.inputrc ] && ln -s ~/.dotfiles/config/dot-inputrc ~/.inputrc

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
