#!/bin/bash

# Give Starship a priority; use powerline-go as fallback
if command -v "starship" >/dev/null; then
    return
fi

function _update_ps1() {

    #PS1="$($GOPATH/bin/powerline-go -newline -modules venv,ssh,perms,git,hg,jobs,exit,root,docker,kube,wsl -cwd-mode plain -hostname-only-if-ssh -trim-ad-domain -mode compatible)"
    PS1="$(powerline-go -modules cwd,docker,exit,jobs,git,kube,perms,root,ssh,venv,wsl -newline -hostname-only-if-ssh -trim-ad-domain -mode compatible)"


    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

if command -v "powerline-go" >/dev/null; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
