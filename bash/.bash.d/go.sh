#!/bin/bash
if [[ -z "$GOPATH" ]]; then
    GOPATH="$HOME/go"
    export GOPATH
fi
PATH=$PATH:$GOPATH/bin
export PATH
