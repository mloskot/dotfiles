#!/bin/bash

if [[ -d "${HOME}/.git-fuzzy" ]]; then
    export PATH="${HOME}/.git-fuzzy/bin:$PATH"
fi
