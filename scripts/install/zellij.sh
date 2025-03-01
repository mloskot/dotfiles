#!/bin/bash
set -x

if [ ! -x /usr/bin/lsb_release ]; then
    echo "Linux expected"
    exit 1
fi

VERSION=$(curl -s "https://api.github.com/repos/zellij-org/zellij/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
if [[ $VERSION =~ ^([0-9]+\.){0,2}(\*|[0-9]+)$ ]]; then
    echo "Downloading zellij $VERSION"
else
    echo "Cannot validate version: $VERSION"
    exit 1
fi

curl -LO "https://github.com/zellij-org/zellij/releases/download/v${VERSION}/zellij-x86_64-unknown-linux-musl.tar.gz"
sudo tar xf zellij-x86_64-unknown-linux-musl.tar.gz -C /usr/local/bin zellij
rm -f zellij-x86_64-unknown-linux-musl.tar.gz

zellij --version
