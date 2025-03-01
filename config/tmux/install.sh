#!/bin/bash

target=${HOME}/.tmux.conf
if [[ -L "${target}" ]]; then
    echo "Deleting symlink ${target}"
    rm "${target}"
fi
echo "Symlinking ${PWD}/.tmux.conf to ${target}"
ln -s "${PWD}/.tmux.conf" "${target}"

if [[ ! -d "${HOME}/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi