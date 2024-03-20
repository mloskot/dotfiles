#!/bin/bash
if ! command -v "fzf" >/dev/null; then
    return
fi

# Prefer binding CTRL+R for Atuin, if it is available
if command -v "atuin" >/dev/null; then
    return
fi

eval "$(fzf --bash)"
