#!/bin/bash
if  [[ "$(uname)" =~ "MINGW64_NT" ]]; then
    export PATH=/f/core-git-tools/user:$PATH
fi

if [[ -d /mnt/f/core-git-tools/user ]]; then
    export PATH=/mnt/f/core-git-tools/user:$PATH
fi
