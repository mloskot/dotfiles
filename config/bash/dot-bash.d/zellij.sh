#!/bin/bash
if ! command -v "zellij" >/dev/null; then
    return
fi

alias zj='zellij'
alias zlw='zellij -l welcome'

# Bash completion and aliases from Zellij (i.e. zr, zrf, ze, zef)
source <(zellij setup --generate-completion bash) >/dev/null 2>&1
