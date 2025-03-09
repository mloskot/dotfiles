#!/bin/bash
set -e

source ~/.dotfiles/log.sh

sudo apt update -y
sudo apt upgrade -y
sudo apt install \
  curl \
  git \
  unzip

# Run terminal installers
for installer in ~/.dotfiles/install/terminal/*.sh
do
    source $installer
done