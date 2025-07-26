#!/bin/bash
source ~/.dotfiles/backup.sh
backup_file ~/.config/k9s/aliases.yaml
backup_file ~/.config/k9s/config.yaml
backup_file ~/.config/k9s/views.yaml

source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing K9s"

VERSION=$(curl -s "https://api.github.com/repos/derailed/k9s/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading K9s ${VERSION}"

curl -Lo k9s.deb "https://github.com/derailed/k9s/releases/latest/download/k9s_linux_amd64.deb"
sudo dpkg -i k9s.deb
rm -f k9s.deb

installed_cmd="$(command -v k9s)"
installed_ver="$(k9s version)"
echolog "Installed ${installed_cmd} ${installed_ver}"

mkdir -p ~/.config/k9s
echolog "Installing ~/.config/k9s/aliases.yaml"
[[ ! -L ~/.config/k9s/aliases.yaml ]] && ln -s ~/.dotfiles/config/k9s/aliases.yaml ~/.config/k9s/aliases.yaml || true
echolog "Installing ~/.config/k9s/config.yaml"
[[ ! -L ~/.config/k9s/config.yaml ]] && ln -s ~/.dotfiles/config/k9s/config.yaml ~/.config/k9s/config.yaml || true
echolog "Installing ~/.config/k9s/views.yaml"
[[ ! -L ~/.config/k9s/views.yaml ]] && ln -s ~/.dotfiles/config/k9s/views.yaml ~/.config/k9s/views.yaml || true

echolog "Installing Catppuccing for K9s"
K9S_SKINS="${XDG_CONFIG_HOME:-$HOME/.config}/k9s/skins"
mkdir -p "$K9S_SKINS"
curl -L https://github.com/catppuccin/k9s/archive/main.tar.gz | \
  tar -xz --directory "$K9S_SKINS" --strip-components=2 k9s-main/dist
