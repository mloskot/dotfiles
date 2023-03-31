#!/bin/bash
if  [[ "$(uname)" =~ "MINGW64_NT" ]]; then
    echo "Setting MSYS_NO_PATHCONV=1 to resolve Azure CLI issues on Windows 10"
    export MSYS_NO_PATHCONV=1
fi