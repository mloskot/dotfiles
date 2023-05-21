#!/bin/bash
echo "Loading ~/.bash_alises"

# Basics
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias llm='ls -la | more'
alias h='history'
alias hu='history -a;history -n'
alias hl='history | tail -n 30'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias l='ls --color=auto'
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Editors
#alias c='code' # already in PATH
if [[ -n "${WSL_DISTRO_NAME}" ]]; then
    alias ci='/mnt/c/Program\ Files/Microsoft\ VS\ Code\ Insiders/bin/code-insiders'
else
    alias ci='/c/Program\ Files/Microsoft\ VS\ Code\ Insiders/bin/code-insiders'
fi
alias v='vim'
alias vi='vim'

alias rtree='tree -I .git -a'
