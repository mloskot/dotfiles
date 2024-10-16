#!/bin/sh
set -x

if [ ! -x /usr/bin/lsb_release ]; then
    echo "Linux expected"
    exit 1
fi

curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | bash

curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh


