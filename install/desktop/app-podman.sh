#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Podman Desktop"

VERSION=$(curl -s "https://api.github.com/repos/podman-desktop/podman-desktop/releases/latest" | \
  grep -Po '"tag_name":\s*"v?\K[0-9a-z.]+')

https://github.com/podman-desktop/podman-desktop/releases/download/v1.18.1/podman-desktop-1.18.1.tar.gz
if [[ -d /opt/zen ]]; then
  if /opt/zen/zen --version | grep "${VERSION}" ; then
    echolog "Zen ${VERSION} already installed"
    /opt/zen/zen --version
    VERSION=""
  fi
fi

sudo apt update
sudo apt install -y podman podman-docker

if [[ -n "${VERSION}" ]]; then
  echolog "Downloading Podman Desktop ${VERSION}"
  curl -Lo zen.tar.xz "https://github.com/podman-desktop/podman-desktop/releases/download/${VERSION}/podman-desktop-.${VERSION}tar.xz"
  sudo tar -xf zen.tar.xz --directory /opt
  rm -f zen.tar.xz

  curl -L https://raw.githubusercontent.com/podman-desktop/podman-desktop/refs/heads/dev/build/AppDir/zen.desktop \
    -o "${HOME}/.local/share/applications/zen.desktop"

  echolog "Installing ~/.local/share/applications/zen.desktop"
  sed -i -E 's#Icon=.+#Icon=/opt/zen/browser/chrome/icons/default/default128.png#' \
    ~/.local/share/applications/zen.desktop
  sed -i -E 's#Exec=zen#Exec=/opt/zen/zen#' \
    ~/.local/share/applications/zen.desktop
fi

desktop-file-validate ~/.local/share/applications/zen.desktop

/opt/zen/zen --version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
