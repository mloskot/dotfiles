#!/bin/bash
set -e
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing lazygit"

source ~/.dotfiles/backup.sh
backup_file ~/.config/lazygit/config.yaml

if ! command -v "xclip" >/dev/null; then
  sudo apt update -y
  sudo apt install -y xclip # for copying commit attributes to clipboard
fi

VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading lazygit ${VERSION}"

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${VERSION}_Linux_x86_64.tar.gz"
sudo tar -xzf lazygit.tar.gz --directory /usr/local/bin lazygit
rm -f lazygit.tar.gz

echolog "Installed $(which lazygit) $(lazygit --version)"

echolog "Installing ~/.config/lazygit/config.yaml"
mkdir -p ~/.config/lazygit
if [[ ! -L ~/.config/lazygit/config.yaml ]]; then
  ln -s ~/.dotfiles/config/lazygit/config.yaml ~/.config/lazygit/config.yaml
fi

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
