#!/bin/bash
if ! command -v "mise" >/dev/null; then
    return
fi

alias m='mise'

eval "$(~/.local/bin/mise activate bash)"
