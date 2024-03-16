#!/bin/bash
if ! command -v "fzf" >/dev/null; then
    return 
fi

eval "$(fzf --bash)"
