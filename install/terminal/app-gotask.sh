#!/bin/bash
set -e
# shellcheck disable=SC1090
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing gotask"

VERSION=$(curl -s "https://api.github.com/repos/go-task/task/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading gotask ${VERSION}"

curl -Lo task.deb "https://github.com/go-task/task/releases/download/v${VERSION}/task_linux_amd64.deb"
sudo dpkg -i task.deb
rm -f task.deb

echolog "Installed $(which task) $(task --version)"

[[ "${BASH_SOURCE[0]}" != "${0}" ]] && return 0
