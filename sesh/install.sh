#!/bin/bash

target=${HOME}/.config/sesh
if [[ -L "${target}" ]]; then
    echo "Deleting symlink ${target}"
    rm "${target}"
fi
echo "Symlinking ${PWD} to ${target}"
ln -s "${PWD}" "${target}"
