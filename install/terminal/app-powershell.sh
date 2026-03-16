#!/bin/bash
DOTFILES_ROOT="${DOTFILES_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
export DOTFILES_ROOT
source "${DOTFILES_ROOT}/err.sh" "${BASH_SOURCE[0]}"
source "${DOTFILES_ROOT}/log.sh" "${BASH_SOURCE[0]}"

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

installed_cmd="$(command -v pwsh)"
installed_ver="$(pwsh --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
