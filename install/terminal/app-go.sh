#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing go"

VERSION=$(curl -s https://go.dev/VERSION?m=text | head -n 1)

if ! command -v "go" &>/dev/null || ! go version | grep "${VERSION}" ; then
  echolog "Downloading go ${VERSION}"
  sudo rm -rf /opt/go
  rm -f go.tar.gz
  curl -o go.tar.gz "https://dl.google.com/go/${VERSION}.linux-amd64.tar.gz"
  sudo tar -C /opt -xzf go.tar.gz
  rm -f go.tar.gz

  # shellcheck disable=SC1090
  source ~/.dotfiles/config/bash/dot-bash.d/go.sh
fi

go version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
