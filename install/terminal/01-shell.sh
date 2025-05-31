#!/bin/bash
set -e

source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

source ~/.dotfiles/backup.sh
backup_file ~/.inputrc

echolog "Installing ~/.inputrc"
[ ! -L ~/.inputrc ] && ln -s ~/.dotfiles/config/dot-inputrc ~/.inputrc

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
