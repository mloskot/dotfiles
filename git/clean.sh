#!/bin/bash
for f in .gitconfig*
do
    if [[ -L ${HOME}/${f} ]]; then
        echo "Deleting symlink ${HOME}/${f}"
        rm "${HOME}/${f}"
    fi
    if [[ -f ${HOME}/${f} ]]; then
        echo "Deleting file ${HOME}/${f}"
    fi
done
