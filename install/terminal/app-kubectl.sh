#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

MINOR_VERSION="${MINOR_VERSION:-1.31}"
echolog "Installing kubectl ${MINOR_VERSION}"

if command -v "kubectl" &>/dev/null; then
  KUBECTL_VERSION="$(kubectl version --client 2>/dev/null | grep -Po "Client\s+Version.+v\K[0-9.]+")"
  echolog "Found existing kubectl ${KUBECTL_VERSION}"
fi

if [[ ! $KUBECTL_VERSION =~ $MINOR_VERSION ]]; then
  echolog "Adding apt repository"
  sudo mkdir -p -m 755 /etc/apt/keyrings
  [[ -f "/etc/apt/keyrings/kubernetes-apt-keyring.gpg" ]] && sudo rm -f /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  curl -fsSL "https://pkgs.k8s.io/core:/stable:/v${MINOR_VERSION}/deb/Release.key" | \
    sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v${MINOR_VERSION}/deb/ /" | \
    sudo tee /etc/apt/sources.list.d/kubernetes.list
  sudo apt modernize-sources -y
  sudo apt update -y
  sudo apt install -y kubectl

  echolog "Installing Krew plugin"
  curl -LO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew-linux_amd64.tar.gz"

  tar -xzf krew-linux_amd64.tar.gz
  ./krew-linux_amd64 install krew
  rm ./krew*
fi

echolog "Installed $(which kubectl) $(kubectl version --client)"

PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
echolog "Installed $(which kubectl-krew)\n$(kubectl krew version)"

echolog "Installing Krew plugin: grep"
kubectl krew install grep

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
