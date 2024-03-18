#!/bin/bash
tmux rename-window git
tmux send-keys "lazygit" Enter

tmux new-window
tmux rename-window terraform
tmux send-keys "terraform version" Enter

tmux new-window
tmux rename-window bash
tmux send-keys "clear" Enter

tmux select-window -p
