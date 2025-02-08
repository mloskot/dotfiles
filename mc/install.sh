#!/bin/bash

mkdir -p "${HOME}/.config/mc"

for f in ini
do
    L="${HOME}/.config/mc/${f}"
    if [[ -L ${L} ]]; then
        echo "Deleting symlink ${L}"
        rm "${L}"
    fi
    if [[ -f ${L} ]]; then
        echo "Backing up ${L} to ${L}.original"
        mv -f "${L}" "${L}.original"
    fi
    echo "Symlinking ${PWD}/${f} to ${L}"
    ln -s "${PWD}/${f}" "${L}"
done

mkdir -p "${HOME}/.local/share/mc/skins"
pushd "${HOME}/.local/share/mc/skins" || exit
curl -OL https://raw.githubusercontent.com/catppuccin/mc/refs/heads/main/catppuccin.ini
popd | exit
