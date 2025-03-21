#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

mkdir -p ~/.local/share/fonts
pushd /tmp

pkgs=(0xProto CascadiaMono)
for pkg in "${pkgs[@]}"; do
  echolog "Installing font: ${pkg}"
  rm -rf "${pkg}.zip" "${pkg}"
  curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${pkg}.zip"
  unzip "${pkg}.zip" -d "${pkg}"
  pushd "${pkg}"
  mv ./*.ttf ~/.local/share/fonts
  popd
  rm -rf "${pkg}.zip" "${pkg}"
done

popd

fc-cache

default_font="0xProto Nerd Font Mono"
echolog "Setting ${default_font} as the default monospace font"
gsettings set org.gnome.desktop.interface monospace-font-name "${default_font} 12"
