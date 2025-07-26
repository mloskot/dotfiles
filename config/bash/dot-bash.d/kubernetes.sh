#!/bin/bash
if ! command -v kubectl > /dev/null; then
  return
fi

source <(kubectl completion bash)
complete -o default -F __start_kubectl k

PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH

# K9s
alias k9r='k9s --readonly --command pulses'

# kubectl, unless fubectl exists
if test -f ~/.config/fubectl/fubectl.source; then
  return
fi
alias k='kubectl'
alias ka='kubectl apply'
alias kci='kubectl cluster-info'
alias kcns='kubectl config set-context --current --namespace'
alias kd='kubectl delete'
alias kds='kubectl describe'
alias kdsn='kubectl describe nodes'
alias kdnz="kubectl get nodes -o custom-columns=NAME:'{.metadata.name}',REGION:'{.metadata.labels.topology\.kubernetes\.io/region}',ZONE:'{metadata.labels.topology\.kubernetes\.io/zone}'"
alias ke='kubectl get events --sort-by=".lastTimestamp"'
alias kl='kubectl log'
alias kn='kubectl get node'
alias knw='kubectl get node -o wide'
alias kp='kubectl get pod'
alias kpw='kubectl get pod -o wide'
alias kv='kubectl version --output=yaml'
alias kx='kubectl exec -i -t'

# Unset SHELL for Git Bash, see https://github.com/ahmetb/kubectx/issues/330#issuecomment-1506657091
alias kctx='SHELL= kubectx'
alias kns='SHELL= kubens'
