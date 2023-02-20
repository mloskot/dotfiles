#!/bin/bash
echo "Loading ~/.bash_profile"

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
