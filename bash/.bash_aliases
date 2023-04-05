#!/bin/bash

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
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Editors
alias c='code'
alias v='vim'
