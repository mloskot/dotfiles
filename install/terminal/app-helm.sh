#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

VERSION=$(curl -s "https://api.github.com/repos/helm/helm/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')

if command -v "helm" &>/dev/null; then
  HELM_VERSION="$(helm version --short 2>/dev/null)"
  echolog "Found existing Helm ${HELM_VERSION}"
fi

if [[ ! $HELM_VERSION =~ $VERSION ]]; then
  echolog "Installing Helm ${VERSION}"

  HELM_INSTALL_DIR=~/.local/bin
  export HELM_INSTALL_DIR
  curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
  export -n HELM_INSTALL_DIR
fi

installed_cmd="$(command -v helm)"
installed_ver="$(helm version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
