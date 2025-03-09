#!/bin/bash
set -e
source ~/.dotfiles/log.sh ${BASH_SOURCE[0]}

source ~/.dotfiles/backup.sh
backup ~/.bashrc 
backup ~/.bash.d

echolog "Installing ~/.bashrc"
[[ ! -L ~/.bashrc ]] && ln -s ~/.dotfiles/config/bash/dot-bashrc ~/.bashrc

echolog "Installing ~/.bash.d"
[[ ! -L ~/.bash.d ]] && ln -s ~/.dotfiles/config/bash/dot-bash.d ~/.bash.d

echolog "Done"
