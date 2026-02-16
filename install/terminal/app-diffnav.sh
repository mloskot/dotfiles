#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing diffnav"

VERSION=$(curl -s "https://api.github.com/repos/dlvhdr/diffnav/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading diffnav ${VERSION}"

curl -Lo diffnav.tar.gz "https://github.com/dlvhdr/diffnav/releases/latest/download/diffnav_Linux_x86_64.tar.gz"
tar -xzf diffnav.tar.gz --directory ~/.local/bin diffnav
rm -f diffnav.tar.gz

installed_cmd="$(command -v diffnav)"
installed_ver="$(diffnav --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
