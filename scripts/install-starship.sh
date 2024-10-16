#!/bin/sh
set -x

if [ ! -x /usr/bin/lsb_release ]; then
    echo "Linux expected"
    exit 1
fi

curl -sS https://starship.rs/install.sh | sh
