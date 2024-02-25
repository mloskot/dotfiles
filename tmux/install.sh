#!/bin/bash

target=${HOME}/.tmux.conf
if [[ -L "${target}" ]]; then
    echo "Deleting symlink ${target}"
    rm "${target}"
fi
echo "Symlinking ${PWD}/.tmux.conf to ${target}"
ln -s "${PWD}/.tmux.conf" "${target}"
