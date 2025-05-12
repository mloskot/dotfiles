#!/bin/bash
if [[ -d /opt/go ]]; then
    PATH=$PATH:/opt/go/bin
elif [[ -d /usr/local/go/bin ]]; then
    PATH=$PATH:/usr/local/go/bin
fi

if [[ -d $HOME/go/bin ]]; then
    PATH=$PATH:$HOME/go/bin
fi

export PATH

if [[ -z "$GOPATH" ]]; then
    GOPATH="$HOME/go"
    export GOPATH
fi
