#!/bin/bash

if ! command -v "kubebuilder" >/dev/null; then
    return
fi

. <(kubebuilder completion bash)
