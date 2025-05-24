#!/bin/bash
if ! command -v "terraform" >/dev/null; then
    return
fi

alias tf='terraform'
