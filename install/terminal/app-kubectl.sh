#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

VERSION=1.32
echolog "Installing kubectl ${VERSION}"

if command -v "kubectl" &>/dev/null; then
  echolog "Found existing kubectl"
  kubectl version 2>/dev/null | grep -E "Client.+v${VERSION}"
fi

if ! command -v "kubectl" &>/dev/null || ! kubectl version | grep -E "Client.+v${VERSION}" ; then
  echolog "Adding apt repository"
  sudo mkdir -p -m 755 /etc/apt/keyrings
  [[ -f "/etc/apt/keyrings/kubernetes-apt-keyring.gpg" ]] && sudo rm -f /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  curl -fsSL https://pkgs.k8s.io/core:/stable:/v${VERSION}/deb/Release.key | \
    sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v${VERSION}/deb/ /" | \
    sudo tee /etc/apt/sources.list.d/kubernetes.list
  sudo apt modernize-sources -y
  sudo apt update -y
  sudo apt install -y kubectl
fi

kubectl version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
