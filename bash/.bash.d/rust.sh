#!/bin/bash
if test ! -f "$HOME/.cargo/env"; then
    return
fi

source "$HOME/.cargo/env"
