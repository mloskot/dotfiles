#!/bin/bash

# TODO: https://github.com/jesseduffield/lazygit/discussions/4243
target=${HOME}/.config/lazygit/config.yml
if [[ -L "${target}" ]]; then
    echo "Deleting symlink ${target}"
    rm "${target}"
fi
if [[ -f "${target}" ]]; then
    mv "${target}" "${target}.original"
fi
echo "Symlinking ${PWD}/config.yaml to ${target}"
ln -s "${PWD}/config.yaml" "${target}"
