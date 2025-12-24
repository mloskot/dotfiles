#!/bin/bash
if ! command -v "docker" >/dev/null; then
    return
fi

alias dce='docker container exec'
alias dcl='docker container logs'
alias dcs='docker container ls'
alias dis='docker image ls'
