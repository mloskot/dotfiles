#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
set -x
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y clean
