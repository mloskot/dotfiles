#!/bin/bash
set -x

if [ ! -x /usr/bin/lsb_release ]; then
    echo "Linux expected"
    exit 1
fi

VERSION=$(curl -s "https://api.github.com/repos/zen-browser/desktop/releases/latest" | grep -Po '"tag_name": "\K[0-9a-z.]+')
if [ -d /opt/zen ]; then
    if /opt/zen/zen --version | grep "${VERSION}" ; then
        echo "zen ${VERSION} already installed:"
        /opt/zen/zen --version
        echo "Skipping"
    fi
fi

curl -Lo zen.tar.xz "https://github.com/zen-browser/desktop/releases/download/${VERSION}/zen.linux-x86_64.tar.xz"
sudo tar -C /opt -xf zen.tar.xz
rm -f zen.tar.xz

curl -Lo "${HOME}/.local/share/applications/zen.desktop" \
  https://raw.githubusercontent.com/zen-browser/desktop/refs/heads/dev/AppDir/zen.desktop

zen --version
