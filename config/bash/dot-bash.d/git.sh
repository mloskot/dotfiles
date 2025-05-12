#!/bin/bash

for e in nvim vim vi; do
  if command -v "${e}" >/dev/null; then
    # Git Bash seems unfolding /usr/bin/vim as C:/Program Files/Git/usr/bin/vim
    GIT_EDITOR=${e}
    export GIT_EDITOR
    break
  else
    unset GIT_EDITOR
  fi
done

# easy signing in terminal
GPG_TTY=$(tty)
export GPG_TTY

# git
alias g='git'
alias gad='git add'
alias gada='git add -A'
alias gbr='git branch'
alias gbra='git branch -a'
alias gbrv='git branch -vv'
alias gci='git commit --signoff'
alias gcia='git commit --amend --signoff'
alias gciae='git commit --amend --no-edit --signoff'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gcpm='git cherry-pick -x -e -m1'
alias gcpx='git cherry-pick -x -e'
alias gd='git diff'
alias gds='git diff --staged'
alias ghs='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias gl='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gla='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --all'
alias glo='git log  --color --graph --oneline --date=iso'
alias gmb='git merge --log --no-ff'
alias gph='git push'
alias gpl='git pull'
alias gpr='git pull --rebase'
alias grs='git reset'
alias grt='git remote -v'
alias gsh='git show'
alias gst='git status'
alias gsts='git submodule status'
alias gsw='git switch'
alias gwo='git show --date=iso --pretty=fuller --show-signature --no-patch'

## Git Custom Comands
### Git Goes Back to Main (updating and deleting previous topic branch, if merged)
alias ggbm='git switch main && git pull origin main && git br -d @{-1} && git fetch --all --prune'
if [[ -f "/mnt/c/Windows/System32/cmd.exe" ]]; then
    alias fork='/mnt/c/Windows/System32/cmd.exe /c "%USERPROFILE%\AppData\Local\Fork\Fork.exe "$(wslpath -w -a .)'
fi
alias gu='gitui'
alias lg='lazygit'

function git-watch() {
  watch -ct -n1 git --no-pager log --color --all --oneline --decorate --graph
}
