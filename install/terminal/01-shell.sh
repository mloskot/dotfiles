#!/bin/bash
set -e
source ~/.dotfiles/log.sh ${BASH_SOURCE[0]}

source ~/.dotfiles/backup.sh
backup ~/.inputrc 

echolog "Installing ~/.inputrc"  
[ ! -L ~/.inputrc ] && ln -s ~/.dotfiles/config/dot-inputrc ~/.inputrc

echolog "Done"