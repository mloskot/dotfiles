#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing PowerShell"

sudo apt update -y

VERSION=$(curl -s "https://api.github.com/repos/PowerShell/PowerShell/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
curl -Lo powershell.deb "https://github.com/PowerShell/PowerShell/releases/latest/download/powershell_${VERSION}-1.deb_amd64.deb"
sudo dpkg -i powershell.deb
sudo apt-get install -f
rm -f powershell.deb

installed_cmd="$(command -v pwsh)"
installed_ver="$(pwsh --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
