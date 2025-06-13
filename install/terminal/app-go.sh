#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing go"

VERSION=$(curl -s https://go.dev/VERSION?m=text | head -n 1)

if ! command -v "go" &>/dev/null || ! go version | grep "${VERSION}" ; then
  echolog "Downloading go ${VERSION}"
  sudo rm -rf /opt/go
  rm -f go.tar.gz
  curl -o go.tar.gz "https://dl.google.com/go/${VERSION}.linux-amd64.tar.gz"
  sudo tar -xzf go.tar.gz --directory /opt
  rm -f go.tar.gz

    source ~/.dotfiles/config/bash/dot-bash.d/go.sh
fi

installed_cmd="$(command -v go)"
installed_ver="$(go version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
