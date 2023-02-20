#!/bin/bash
echo "Loading ~/.bashrc"

if [ -d ~/.bash.d ]; then
  for f in ~/.bash.d/*.sh; do
    if [ -r $f ]; then
        echo "Loading $f"
      . "$f"
    fi
  done
  unset f
fi

function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -newline -modules venv,ssh,cwd,perms,git,hg,jobs,exit,root,docker,kube,wsl -cwd-mode plain -hostname-only-if-ssh -trim-ad-domain)"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
