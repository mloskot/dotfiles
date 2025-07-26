#!/bin/bash
source ~/.dotfiles/backup.sh
backup_file ~/.bashrc
backup_file ~/.bash_aliases
backup_file ~/.bash.d

source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing ~/.bashrc"
[[ ! -L ~/.bashrc ]] && ln -s ~/.dotfiles/config/bash/dot-bashrc ~/.bashrc || true
echolog "Installing ~/.bash_aliases"
[[ ! -L ~/.bash_aliases ]] && ln -s ~/.dotfiles/config/bash/dot-bash_aliases ~/.bash_aliases || true
echolog "Installing ~/.bash.d"
[[ ! -L ~/.bash.d ]] && ln -s ~/.dotfiles/config/bash/dot-bash.d ~/.bash.d || true
