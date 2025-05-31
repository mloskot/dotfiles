#!/bin/bash
if ! command -v "lazygit" >/dev/null; then
    return
fi

LG_CONFIG_FILE="${HOME}/.config/lazygit/config.yaml"
export LG_CONFIG_FILE
