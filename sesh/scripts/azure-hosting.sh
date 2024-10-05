#!/bin/bash
az_env=$1

tmux rename-window infrastructure
tmux send-keys "echo ${az_env}" Enter

tmux select-window -t 0
