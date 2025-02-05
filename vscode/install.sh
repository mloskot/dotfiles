#!/bin/bash

for f in keybindings.json settings.json
do
    L="${HOME}/.config/Code/User/${f}"
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
