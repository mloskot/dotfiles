#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing zellij"

VERSION=$(curl -s "https://api.github.com/repos/zellij-org/zellij/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading zellij ${VERSION}"

curl -LO "https://github.com/zellij-org/zellij/releases/download/v${VERSION}/zellij-x86_64-unknown-linux-musl.tar.gz"
sudo tar -xzf zellij-x86_64-unknown-linux-musl.tar.gz --directory /usr/local/bin zellij
rm -f zellij-x86_64-unknown-linux-musl.tar.gz

installed_cmd="$(command -v zellij)"
installed_ver="$(zellij --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
