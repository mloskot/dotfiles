#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

MINOR_VERSION="${MINOR_VERSION:-1.33}"
echolog "Installing kubectl ${MINOR_VERSION}"

if command -v "kubectl" &>/dev/null; then
  KUBECTL_VERSION="$(kubectl version --client 2>/dev/null | grep -Po "Client\s+Version.+v\K[0-9.]+")"
  echolog "Found existing kubectl ${KUBECTL_VERSION}"
fi

if [[ ! $KUBECTL_VERSION =~ $MINOR_VERSION ]]; then
  echolog "Adding apt repository"
  sudo mkdir -m 755 -p /etc/apt/keyrings
  [[ -f "/etc/apt/keyrings/kubernetes-apt-keyring.gpg" ]] && sudo rm -f /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  curl -fsSL "https://pkgs.k8s.io/core:/stable:/v${MINOR_VERSION}/deb/Release.key" | \
    sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  sudo rm -f /etc/apt/sources.list.d/kubernetes.list*
  echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v${MINOR_VERSION}/deb/ /" | \
    sudo tee /etc/apt/sources.list.d/kubernetes.list
  sudo apt modernize-sources -y
  sudo apt update -y
  sudo apt install -y kubectl

  echolog "Installing Krew plugin"
  curl -LO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew-linux_amd64.tar.gz"

  tar -xzf krew-linux_amd64.tar.gz krew-linux_amd64
  ./krew-linux_amd64 install krew
  rm ./krew*
fi

installed_cmd="$(command -v kubectl)"
installed_ver="$(kubectl version --client)"
echolog "Installed ${installed_cmd} ${installed_ver}"

PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

installed_cmd="$(command -v kubectl-krew)"
installed_ver="$(kubectl krew version)"
echolog "Installed ${installed_cmd}\n${installed_ver}"

echolog "Installing Krew plugin: grep"
kubectl krew install grep
