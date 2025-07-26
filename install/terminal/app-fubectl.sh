#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing fubectl"

curl -LO https://rawgit.com/kubermatic/fubectl/main/fubectl.source
rm -rf ~/.config/fubectl
mkdir -p ~/.config/fubectl
mv  fubectl.source ~/.config/fubectl/fubectl.source

echolog "Installed $(file ~/.config/fubectl/fubectl.source)"
