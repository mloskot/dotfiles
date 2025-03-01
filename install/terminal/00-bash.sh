#!/bin/bash
# Configure the Bash shell

[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.original
ln -s ~/.dotfiles/config/bash/bashrc ~/.bashrc