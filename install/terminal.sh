#!/bin/bash
set -x

if [ ! -x /usr/bin/lsb_release ]; then
    echo "Linux expected"
    exit 1
fi

sudo apt update -y
sudo apt upgrade -y
sudo apt install \
  curl \
  git \
  unzip \
  wget

# TODO


