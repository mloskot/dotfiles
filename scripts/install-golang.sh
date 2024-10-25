#!/bin/sh
set -x
MY_GO_VERSION=1.23.2

if [ ! -x /usr/bin/lsb_release ]; then
    echo "Linux expected"
    exit 1
fi

if ! go version | grep "${MY_GO_VERSION}" ; then
    sudo rm -rf /opt/go
    rm -f go.tar.gz
    curl -o go.tar.gz "https://dl.google.com/go/go${MY_GO_VERSION}.linux-amd64.tar.gz"
    sudo tar -C /opt -xzf go.tar.gz
    rm -f go.tar.gz
fi
