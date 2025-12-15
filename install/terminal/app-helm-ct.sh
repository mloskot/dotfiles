#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

VERSION=$(curl -s "https://api.github.com/repos/helm/chart-testing/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')

if command -v "ct" &>/dev/null; then
  CT_VERSION="$(ct version 2>/dev/null | grep -Po "Version.+v\K[0-9.]+")"
  echolog "Found existing ct ${HELM_VERSION}"
else
  # Install ct dependencies
  sudo apt install -y python3-yamale yamllint
fi

if [[ ! $CT_VERSION =~ $VERSION ]]; then
  echolog "Installing ct ${VERSION}"

  curl -Lo chart-testing.tar.gz "https://github.com/helm/chart-testing/releases/download/v${VERSION}/chart-testing_${VERSION}_linux_amd64.tar.gz"
  tar -xzf chart-testing.tar.gz --directory ~/.local/bin ct
  sudo rm -rf ~/.ct
  sudo tar -xzf chart-testing.tar.gz --directory . etc
  sudo chown -R "${USER}" ./etc
  mv ./etc ~/.ct
  rm -f chart-testing.tar.gz
fi

installed_cmd="$(command -v ct)"
installed_ver="$(ct version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
