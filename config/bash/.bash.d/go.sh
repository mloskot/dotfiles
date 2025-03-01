#!/bin/bash
if [[ -d /opt/go ]]; then
    export PATH=$PATH:/opt/go/bin
elif [[ -d /usr/local/go/bin ]]; then
    export PATH=$PATH:/usr/local/go/bin
fi

if [[ -d $HOME/go/bin ]]; then
    PATH=$PATH:$HOME/go/bin
    export PATH
fi

if [[ -z "$GOPATH" ]]; then
    GOPATH="$HOME/go"
    export GOPATH
fi
