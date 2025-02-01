#!/bin/sh
set -x

if [ ! -x /usr/bin/lsb_release ]; then
    echo "Linux expected"
    exit 1
fi

VERSION=$(curl -s https://go.dev/VERSION?m=text | head -n 1)

if ! go version | grep "${VERSION}" ; then
    sudo rm -rf /opt/go
    rm -f go.tar.gz
    curl -o go.tar.gz "https://dl.google.com/go/${VERSION}.linux-amd64.tar.gz"
    sudo tar -C /opt -xzf go.tar.gz
    rm -f go.tar.gz
fi

go version
