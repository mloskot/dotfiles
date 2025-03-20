#!/bin/bash

if ! command -v "podman" >/dev/null; then
    return
fi

if command -v "docker" >/dev/null; then
    return
fi

if command -v podman > /dev/null; then
    ln -s "$(command -v podman)" "$HOME/.local/bin/docker"
fi
