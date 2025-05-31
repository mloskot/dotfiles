#!/bin/bash
source ~/.dotfiles/err.sh "${BASH_SOURCE[0]}"
source ~/.dotfiles/log.sh "${BASH_SOURCE[0]}"

echolog "Installing Slack"

VERSION=$(curl -s https://slack.com/intl/en-gb/downloads/linux | grep -Po 'Version \K[0-9.]+')
echolog "Downloading Slack ${VERSION}"
curl -Lo slack.deb "https://downloads.slack-edge.com/desktop-releases/linux/x64/${VERSION}/slack-desktop-${VERSION}-amd64.deb"
sudo dpkg -i slack.deb
rm -f slack.deb
