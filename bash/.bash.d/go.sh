#!/bin/bash

if [[ -d /usr/local/go/bin ]]; then
    export PATH=$PATH:/usr/local/go/bin
fi

if [[ -z "$GOPATH" ]]; then
    GOPATH="$HOME/go"
    export GOPATH
fi
PATH=$PATH:$GOPATH/bin
export PATH
