#!/bin/bash
if test ! -f "$HOME/.cargo/env"; then
    return
fi

#shellcheck disable=SC1091
source "$HOME/.cargo/env"
