#!/bin/bash
az_tenant_id=$(az account show --query homeTenantId --output tsv)
if [[ "${az_tenant_id}" =~ ^21b22257.* ]]; then
    az_tenant_id="${az_tenant_id}/"
else
    az_tenant_id="/"
fi

tmux rename-window infrastructure
tmux send-keys "cd ~/azure-hosting/azure-hosting-infrastructure" Enter

tmux new-window
tmux rename-window gitops
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops && direnv allow" Enter

tmux new-window
tmux rename-window cluster-dev
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops/clusters/${az_tenant_id}dev && direnv allow" Enter

tmux new-window
tmux rename-window cluster-qlt
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops/clusters/${az_tenant_id}qlt && direnv allow" Enter

tmux new-window
tmux rename-window cluster-stg
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops/clusters/${az_tenant_id}stg && direnv allow" Enter

tmux new-window
tmux rename-window cluster-stg
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops/clusters/${az_tenant_id}tst && direnv allow" Enter

tmux new-window
tmux rename-window cluster-prd
tmux send-keys "cd ~/azure-hosting/azure-hosting-gitops/clusters/${az_tenant_id}prd && direnv allow" Enter

tmux new-window
tmux rename-window inventory
tmux send-keys "cd ~/azure-hosting/azure-hosting-inventory" Enter

tmux new-window
tmux rename-window docs
tmux send-keys "cd ~/azure-hosting/azure-hosting-docs" Enter

tmux select-window -t 0
