#!/bin/bash
echo "Loading ~/.bash_profile"

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
    . "$HOME/.bash_aliases"
fi

function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $? -jobs $(jobs -p | wc -l) --hostname-only-if-ssh -condensed --trim-ad-domain -modules venv,host,ssh,cwd,perms,git,jobs,exit,root)"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

export PATH=/f/core-git-tools/user:$PATH
export PATH="$HOME/.tfenv/bin:$PATH"
