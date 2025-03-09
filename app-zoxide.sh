#!/bin/bash
set -e
source ~/.dotfiles/log.sh ${BASH_SOURCE[0]}

source ~/.dotfiles/backup.sh
backup ~/.config/starship.toml 

echolog "Installing atuin"
curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | bash
curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh


echolog "Installing ~/.config/starship.toml"
ln -s ~/.dotfiles/config/starship/starship.toml ~/.config/starship.toml

return 0