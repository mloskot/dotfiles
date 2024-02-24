#!/bin/bash
if ! command -v "zoxide" >/dev/null; then
    return
fi

eval "$(zoxide init bash)"
alias cd=z