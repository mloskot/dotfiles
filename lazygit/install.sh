#!/bin/bash

target=${HOME}/.config/lazygit/config.yml
if [[ -L "${target}" ]]; then
    echo "Deleting symlink ${target}"
    rm "${target}"
fi
echo "Symlinking ${PWD}/config.yml to ${target}"
ln -s "${PWD}/config.yml" "${target}"
