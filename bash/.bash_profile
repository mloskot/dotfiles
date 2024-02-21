#!/bin/bash
#echo "Loading ~/.bash_profile"

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
. "$HOME/.cargo/env"
