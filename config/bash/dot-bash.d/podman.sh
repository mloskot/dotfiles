#!/bin/bash
if ! command -v "podman" >/dev/null; then
    return
fi

if ! command -v "docker" >/dev/null; then
  ln -s "$(command -v podman)" "$HOME/.local/bin/docker"
fi

# shellcheck disable=SC1090
source <(podman completion bash)

alias p='podman'
alias pcl='podman container ls'
alias pil='podman image ls'
alias pps='podman ps -a'
