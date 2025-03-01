#!/bin/bash
set -x

if [ ! -x /usr/bin/lsb_release ]; then
    echo "Linux expected"
    exit 1
fi

VERSION=$(curl -s "https://api.github.com/repos/go-task/task/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')

curl -Lo task.deb "https://github.com/go-task/task/releases/download/v${VERSION}/task_linux_amd64.deb"
sudo dpkg -i task.deb
rm -f task.deb
