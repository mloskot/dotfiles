#!/bin/bash

mkdir -p ${HOME}/.config/zed

# shellcheck disable=SC2043
for f in settings.json
do
    if [[ -L ${HOME}/.config/zed/${f} ]]; then
        echo "Deleting symlink ${HOME}/.config/zed/${f}"
        rm "${HOME}/.config/zed/${f}"
    fi
    if [[ -f ${HOME}/.config/zed/${f} ]]; then
        echo "Backing up ${HOME}/.config/zed/${f} to ${HOME}/.config/zed/${f}.original"
        mv -f "${HOME}/.config/zed/${f}" "${HOME}/.config/zed/${f}.original"
    fi
    echo "Symlinking ${PWD}/${f} to ${HOME}/.config/zed/${f}"
    ln -s "${PWD}/${f}" "${HOME}/.config/zed/${f}"
done
