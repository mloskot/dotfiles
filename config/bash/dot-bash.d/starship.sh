#!/bin/bash
if ! command -v "starship" >/dev/null; then
    return
fi

export STARSHIP_CONFIG="${HOME}/.dotfiles/config/starship/starship.toml"

eval "$(starship init bash)"
