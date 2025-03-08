#!/bin/bash
# Configure the Bash shell

# Backup original default files only
if [[ ! -L "~/.bashrc" && ! -f "~/.bashrc.original" ]]; then
    echolog "Backing up ~/.bashrc"
    mv ~/.bashrc ~/.bashrc.original
fi
if [[ ! -L "~/.bash.d" && ! -d "~/.bash.d.original" ]]; then
    echolog "Backing up ~/.bash.d"
    mv ~/.bash.d ~/.bash.d.original
fi

echolog "Installing ~/.bashrc"  
[ ! -L "~/.bashrc" ] && ln -s ~/.dotfiles/config/bash/dot-bashrc ~/.bashrc

echolog "Installing ~/.bash.d"
[ ! -L "~/.bash.d" ] && ln -s ~/.dotfiles/config/bash/dot-bash.d ~/.bash.d
