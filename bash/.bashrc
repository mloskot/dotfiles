#!/bin/bash
#echo "Loading ~/.bashrc"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# append to the history file, don't overwrite it
shopt -s histappend
HISTCONTROL=erasedups # ignoreboth
HISTSIZE=5000
HISTFILESIZE=5000

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Some scripts may rely on updated PATH
if [ -d ~/.bash.d ]; then
  for f in ~/.bash.d/*.sh; do
    if [ -r $f ]; then
      #echo "Loading $f"
      # shellcheck disable=SC1090
      source "$f"
    fi
  done
  unset f
fi

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
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
