#!/bin/bash
if ! command -v "gh" >/dev/null; then
    return 
fi

eval "$(gh completion -s bash)"

alias hpc='gh pr create -f'
alias hpl='gh pr list'
alias hpo='gh pr checkout'
alias hrl='gh run list'
alias hrv='gh run view'
alias hwl='gh workflow list'
alias hwr='gh workflow run'
