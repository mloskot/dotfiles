#!/bin/bash
if ! command -v "nvim" >/dev/null; then
    if command -v "/opt/nvim-linux64/bin/nvim" >/dev/null; then
        export PATH="$PATH:/opt/nvim-linux64/bin"
    fi
fi

if ! command -v "nvim" >/dev/null; then
    return
fi
