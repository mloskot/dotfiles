#!/bin/bash

# Install core utilities
sudo apt update
sudo apt install -y direnv gh git golang-go wslu

for f in .bash*
do
    if [[ -L ${HOME}/${f} ]]; then
        echo "Deleting symlink ${HOME}/${f}"
        rm "${HOME}/${f}"
    fi
    if [[ -f ${HOME}/${f} ]]; then
        echo "Backing up ${HOME}/${f} to ${HOME}/${f}.original"
        mv -f "${HOME}/${f}" "${HOME}/${f}.original"
    fi
    echo "Symlinking ${PWD}/${f} to ${HOME}/${f}"
    ln -s "${PWD}/${f}" "${HOME}/${f}"
done
