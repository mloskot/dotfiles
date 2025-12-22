#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing gotask"

VERSION=$(curl -s "https://api.github.com/repos/go-task/task/releases/latest" | grep -Po '"tag_name":\s*"v?\K[0-9.]+')
echolog "Downloading gotask ${VERSION}"

curl -Lo task.deb "https://github.com/go-task/task/releases/download/v${VERSION}/task_${VERSION}_linux_amd64.deb"
sudo dpkg -i task.deb
rm -f task.deb

installed_cmd="$(command -v task)"
installed_ver="$(task --version)"
echolog "Installed ${installed_cmd} ${installed_ver}"
