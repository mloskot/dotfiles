#!/bin/bash
if ! command -v "gh" >/dev/null; then
    return
fi

eval "$(gh completion -s bash)"

alias has='gh auth status'
alias haw='gh auth switch'
alias hil='gh issue list'
alias his='gh issue status'
alias hiv='gh issue view'
alias hpc='gh pr create -f'
alias hpl='gh pr list'
alias hpo='gh pr checkout'
alias hps='gh pr checkout' # s for switch like in git switch, git sw
alias hrl='gh run list'
alias hrv='gh run view'
alias hwl='gh workflow list'
alias hwr='gh workflow run'
