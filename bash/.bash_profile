#!/bin/bash

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
