#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Helm (latest)"

HELM_INSTALL_DIR=~/.local/bin
export HELM_INSTALL_DIR
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
export -n HELM_INSTALL_DIR

installed_cmd="$(command -v helm)"
installed_ver="$(helm version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
