#!/bin/bash

# Install core utilities
sudo apt update
if ! command -v wslfetch; then
    sudo apt install wslu
fi
for tool in direnv gh git go
do
    if ! command -v "${tool}" >/dev/null; then
        sudo apt install -y "${tool}"
    fi
done

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
