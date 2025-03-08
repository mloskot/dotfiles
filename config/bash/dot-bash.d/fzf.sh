#!/bin/bash
if ! command -v "fzf" >/dev/null; then
    return
fi

if command -v "fd" >/dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f'
fi

#FZF_CTRL_T_COMMAND= FZF_ALT_C_COMMAND=
eval "$(fzf --bash)"

# Prefer binding CTRL+R for Atuin, if it is available
if command -v "atuin" >/dev/null; then
    bind -x '"\C-r": __atuin_history'
fi
