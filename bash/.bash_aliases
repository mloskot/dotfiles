#!/bin/bash
# Basics
alias h='history'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias llm='ls -la | more'

alias c='code'
alias v='vim'

# Git
alias g='git'
alias gad='git add'
alias gada='git add -A'
alias gbr='git branch'
alias gbra='git branch -a'
alias gbrv='git branch -vv'
alias gci='git commit'
alias gcia='git commit --amend'
alias gciae='git commit --amend --no-edit'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gcpm='git cherry-pick -x -e -m1'
alias gcpx='git cherry-pick -x -e'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias ghs='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias gl='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gla='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --all'
alias glo='git log  --color --graph --oneline --date=iso'
alias gmb='git merge --log --no-ff'
alias gpl='git pull'
alias gps='git push'
alias grs='git reset'
alias grt='git remote -v'
alias gsh='git show'
alias gst='git status'
alias gsts='git submodule status'
alias gsw='git switch'
alias gwo='git show --date=iso --pretty=fuller --show-signature --no-patch'
alias fork='/mnt/c/Windows/System32/cmd.exe /c "%USERPROFILE%\AppData\Local\Fork\Fork.exe "$(wslpath -w -a .)'
alias lgit='lazygit'

# GitHub CLI

# Azure CLI
alias a='az'
alias ak='az aks'
alias aks='az aks show --query "{Name:name,Status:provisioningState,Power:powerState.code}"'
# DevOps Hosting > AKS
alias aks-dev='az aks show -g rg-aks-cadcorp-dev --name aks-cadcorp-uks-dev-aks --query "{Name:name,Status:provisioningState,Power:powerState.code}" -o table'
#alias aks-dev='(IFS= read -r x; echo "az aks $x --resource-group rg-aks-cadcorp-dev --name aks-cadcorp-uks-dev-aks ";)'

# Kubernetes
alias k='kubectl'
alias ka='kubectl apply'
alias kcsn='kubectl config set-context --current --namespace'
alias kci='kubectl cluster-info'
alias kd='kubectl describe'
alias kdn='kubectl describe nodes'
alias kdnz="kubectl get nodes -o custom-columns=NAME:'{.metadata.name}',REGION:'{.metadata.labels.topology\.kubernetes\.io/region}',ZONE:'{metadata.labels.topology\.kubernetes\.io/zone}'"
alias ke='kubectl exec -i -t'
alias kl='kubectl log'
alias kn='kubectl get node'
alias knw='kubectl get node -o wide'
alias kp='kubectl get pod'
alias kpw='kubectl get pod -o wide'
alias kv='kubectl version --output=yaml'

# Terraform
alias t='terraform'
