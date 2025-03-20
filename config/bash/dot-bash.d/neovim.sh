#!/bin/bash

if command -v "nvim" >/dev/null; then
    return
fi

for c in \
    /opt/neovim/bin/nvim \
    /opt/nvim/bin/nvim \
    /opt/nvim-linux64/bin/nvim \
    /opt/nvim-linux-x86_64/bin/nvim
do
    if command -v "${c}" >/dev/null; then
        export PATH="${PATH}:$(dirname $(command -v "${c}"))"
        break
    fi
done
