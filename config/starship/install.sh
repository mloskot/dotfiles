#!/bin/bash

# shellcheck disable=SC2043
for f in starship.toml
do
    if [[ -L ${HOME}/.config/${f} ]]; then
        echo "Deleting symlink ${HOME}/.config/${f}"
        rm "${HOME}/.config/${f}"
    fi
    if [[ -f ${HOME}/.config/${f} ]]; then
        echo "Backing up ${HOME}/.config/${f} to ${HOME}/.config/${f}.original"
        mv -f "${HOME}/.config/${f}" "${HOME}/.config/${f}.original"
    fi
    echo "Symlinking ${PWD}/${f} to ${HOME}/.config/${f}"
    ln -s "${PWD}/${f}" "${HOME}/.config/${f}"
done
