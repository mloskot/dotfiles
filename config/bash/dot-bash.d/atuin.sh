#!/bin/bash
if [[ -d $HOME/.atuin/bin ]]; then
    PATH=$PATH:$HOME/.atuin/bin
    export PATH
fi

if ! command -v "atuin" >/dev/null; then
    return
fi

export ATUIN_NOBIND="true"
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

# bind to ctrl-r, add any other bindings you want here too
bind -x '"\C-r": __atuin_history'
