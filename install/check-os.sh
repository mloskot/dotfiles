#!/bin/bash

# shellcheck disable=SC1090
source ~/.dotfiles/log.sh

if [ ! -f /etc/os-release ]; then
  echoerr "Unable to determine OS. /etc/os-release file not found."
  echolog "Installation stopped."
  exit 1
fi

# shellcheck disable=SC1091
source /etc/os-release

# Check if running on Ubuntu 24.04 or higher
if [ "$ID" != "ubuntu" ] || [ "$(echo "$VERSION_ID >= 24.04" | bc)" != 1 ]; then
  echoerr "OS requirement not met"
  echolog "You are currently running: $ID $VERSION_ID"
  echolog "OS required: Ubuntu 24.04 or higher"
  echolog "Installation stopped."
  exit 1
fi
