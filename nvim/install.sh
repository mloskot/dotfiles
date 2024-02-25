#!/bin/bash

if [[ -L ${HOME}/.config/nvim ]]; then
    echo "Deleting symlink ${HOME}/.config/nvim"
    rm "${HOME}/.config/nvim"
fi
echo "Symlinking ${PWD}/nvim to ${HOME}/.config/nvim"
ln -s "${PWD}" "${HOME}/.config/nvim"
