#!/bin/sh
set -x
sudo apt-get update -qq
sudo apt-get install -y -qq vim

# TODO: Fix colors for cmd/cmder 
#mkdir -p ~/.vim/colors
#wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -O ~/.vim/colors/molokai.vim
