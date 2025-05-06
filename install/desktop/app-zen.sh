#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Zen browser"

VERSION=$(curl -s "https://api.github.com/repos/zen-browser/desktop/releases/latest" | grep -Po '"tag_name": "\K[0-9a-z.]+')
if [[ -d /opt/zen ]]; then
    if /opt/zen/zen --version | grep "${VERSION}" ; then
        echolog "Zen ${VERSION} already installed"
        /opt/zen/zen --version
        VERSION=""
    fi
fi

if [[ -n "${VERSION}" ]]; then
  echolog "Downloading Zen ${VERSION}"
  curl -Lo zen.tar.xz "https://github.com/zen-browser/desktop/releases/download/${VERSION}/zen.linux-x86_64.tar.xz"
  sudo tar -C /opt -xf zen.tar.xz
  rm -f zen.tar.xz

  curl -L https://raw.githubusercontent.com/zen-browser/desktop/refs/heads/dev/build/AppDir/zen.desktop \
      -o "${HOME}/.local/share/applications/zen.desktop"

  echolog "Installing ~/.local/share/applications/zen.desktop"
  sed -i -E 's#Icon=.+#Icon=/opt/zen/browser/chrome/icons/default/default128.png#' \
      ~/.local/share/applications/zen.desktop
fi

desktop-file-validate ~/.local/share/applications/zen.desktop

/opt/zen/zen --version

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
