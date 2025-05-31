#!/bin/bash
set -e
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing PowerShell"

# FIXME(mloskot): See https://github.com/PowerShell/PowerShell/issues/25415
#VERSION=$(curl -s "https://api.github.com/repos/PowerShell/PowerShell/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
#curl -Lo powershell.deb "https://github.com/PowerShell/PowerShell/releases/latest/download/powershell_${VERSION}-1.deb_amd64.deb"

sudo apt update -y
sudo apt install -y dotnet-runtime-8.0

VERSION=$(curl -s "https://api.github.com/repos/rhubarb-geek-nz/powershell-ubuntu/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading PowerShell ${VERSION} (depens on dotnet-runtime-8.0)"
curl -Lo powershell.deb "https://github.com/rhubarb-geek-nz/powershell-ubuntu/releases/latest/download/powershell_${VERSION}-1.ubuntu_amd64.deb"
sudo dpkg -i powershell.deb
rm -f powershell.deb

echolog "Installed $(which pwsh) $(pwsh --version)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
