#!/bin/bash
# Configure common shell

# Backup original default filea only
if [[ ! -L "~/.inputrc" && ! -f "~/.inputrc.original" ]]; then
    echolog "Backing up ~/.inputrc"
    mv ~/.inputrc ~/.inputrc.original
fi

echolog "Installing ~/.inputrc"  
[ ! -L "~/.inputrc" ] && ln -s ~/.dotfiles/config/dot-inputrc ~/.inputrc
