#!/bin/sh
set -x

if [ ! -x /usr/bin/lsb_release ]; then
    echo "Linux expected"
    exit 1
fi

VERSION=$(curl -s "https://api.github.com/repos/joshmedeski/sesh/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo sesh.tar.gz "https://github.com/joshmedeski/sesh/releases/download/v${VERSION}/sesh_Linux_x86_64.tar.gz"
sudo tar xf sesh.tar.gz -C /usr/local/bin sesh
sudo rm -f sesh.tar.gz
sesh --version


