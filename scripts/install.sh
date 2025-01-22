#!/bin/sh
set -e
set -x

./apt-get-upgrade.sh

for s in atuin golang goreleaser k9s ko lazygit sesh sourcegit starship vim
do
  ./install-"${s}".sh
done
