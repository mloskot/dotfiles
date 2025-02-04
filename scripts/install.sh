#!/bin/sh
set -e
set -x

./apt-get-upgrade.sh

for s in \
    atuin \
    bat \
    fzf \
    golang \
    goreleaser \
    gotask \
    k9s \
    ko \
    lazygit \
    sesh \
    starship \
    vim
do
  ./install-"${s}".sh
done

sudo apt-get -y autoremove && \
sudo apt-get -y autoclean && \
sudo apt-get -y clean
