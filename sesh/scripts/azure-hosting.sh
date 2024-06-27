#!/bin/bash
tmux rename-window infrastructure
tmux send-keys "cd ~/azure-hosting/azure-hosting-infrastructure" Enter

tmux new-window
tmux rename-window gitops
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops && direnv allow" Enter

tmux new-window
tmux rename-window cluster-dev
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops/clusters/dev && direnv allow" Enter

tmux new-window
tmux rename-window cluster-qlt
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops/clusters/qlt && direnv allow" Enter

tmux new-window
tmux rename-window cluster-stg
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops/clusters/stg && direnv allow" Enter

tmux new-window
tmux rename-window cluster-prd
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops/clusters/prd && direnv allow" Enter

tmux new-window
tmux rename-window inventory
tmux send-keys "cd ~/azure-hosting/azure-hosting-inventory" Enter

tmux new-window
tmux rename-window docs
tmux send-keys "cd ~/azure-hosting/azure-hosting-docs" Enter

tmux select-window -t 0
