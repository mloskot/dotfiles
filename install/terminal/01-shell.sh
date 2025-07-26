#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

source ~/.dotfiles/backup.sh
backup_file ~/.inputrc

echolog "Installing ~/.inputrc"
[ ! -L ~/.inputrc ] && ln -s ~/.dotfiles/config/dot-inputrc ~/.inputrc
