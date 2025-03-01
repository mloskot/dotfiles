#!/bin/bash

mkdir -p ${HOME}/.config/alacritty

# shellcheck disable=SC2043
for f in alacritty.toml
do
    if [[ -L ${HOME}/.config/alacritty/${f} ]]; then
        echo "Deleting symlink ${HOME}/.config/alacritty/${f}"
        rm "${HOME}/.config/alacritty/${f}"
    fi
    if [[ -f ${HOME}/.config/alacritty/${f} ]]; then
        echo "Backing up ${HOME}/.config/alacritty/${f} to ${HOME}/.config/alacritty/${f}.original"
        mv -f "${HOME}/.config/alacritty/${f}" "${HOME}/.config/alacritty/${f}.original"
    fi
    echo "Symlinking ${PWD}/${f} to ${HOME}/.config/alacritty/${f}"
    ln -s "${PWD}/${f}" "${HOME}/.config/alacritty/${f}"
done
