#!/bin/bash
set -x

if [ ! -x /usr/bin/lsb_release ]; then
    echo "Linux expected"
    exit 1
fi

PROJECT=goreleaser/goreleaser
VERSION=$(curl -s "https://api.github.com/repos/${PROJECT}/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
echo "Downloading ${PROJECT} ${VERSION}"

curl -Lo goreleaser.deb "https://github.com/${PROJECT}/releases/download/v${VERSION}/goreleaser_${VERSION}_amd64.deb"
sudo dpkg -i goreleaser.deb
sudo rm -f goreleaser.deb
goreleaser --version
