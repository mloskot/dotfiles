#!/bin/sh
set -e
set -x

sudo apt-get update
sudo apt-get install git tmux

MY_GO_VERSION=1.22.5
if ! go version | grep "${MY_GO_VERSION}" ; then
    sudo rm -rf /opt/go
    rm -f go.tar.gz
    curl -o go.tar.gz "https://dl.google.com/go/go${MY_GO_VERSION}.linux-amd64.tar.gz"
    sudo tar -C /opt -xzf go.tar.gz
    rm -f go.tar.gz
fi

curl -sS https://starship.rs/install.sh | sh

curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | bash

curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

go install github.com/joshmedeski/sesh@latest
