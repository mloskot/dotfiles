#!/bin/bash
CC_ENV="${1}"
#export CC_ENV

# Force Azure CLI with configuration path per single environment
# https://learn.microsoft.com/en-us/cli/azure/azure-cli-configuration#cli-configuration-file
AZURE_CONFIG_DIR="${HOME}/.azure-${CC_ENV}"
export AZURE_CONFIG_DIR
az_tenant_id=$(az account show --query homeTenantId --output tsv)
if [[ -z "${az_tenant_id}" ]]; then
  echo "az_tenant_id is empty despite AZURE_CONFIG_DIR=${AZURE_CONFIG_DIR}"
  exit 1
fi

# Set required session-local environment variables
tmux set-environment AZURE_CONFIG_DIR "${AZURE_CONFIG_DIR}"
tmux set-environment CC_ENV "${CC_ENV}"

# Force environment update in window 0
tmux send-keys -t 0 "export AZURE_CONFIG_DIR=${AZURE_CONFIG_DIR}" Enter
tmux send-keys -t 0 "export CC_ENV=${CC_ENV}" Enter
# Configure Window 0 created by sesh
tmux rename-window command
tmux send-keys "cd ~/cadcorp-cloud" Enter

tmux new-window
tmux rename-window infra-tf
tmux send-keys "cd ~/cadcorp-cloud/cadcorp-cloud-infrastructure" Enter
tmux send-keys "mage subscription:switchDefault sub-hosting-${CC_ENV}" Enter

tmux new-window
tmux rename-window infra-git
tmux send-keys "cd ~/cadcorp-cloud/cadcorp-cloud-infrastructure" Enter
tmux send-keys "lazygit" Enter

tmux new-window
tmux rename-window gitops-k8s
tmux send-keys "cd ~/cadcorp-cloud/cadcorp-cloud-gitops/clusters/${az_tenant_id}/${CC_ENV} && direnv allow" Enter

tmux new-window
tmux rename-window gitops-git
tmux send-keys "cd ~/cadcorp-cloud/cadcorp-cloud-gitops/clusters/${az_tenant_id}/${CC_ENV} && direnv allow" Enter
tmux send-keys "lazygit" Enter

tmux new-window
tmux rename-window gitops-k9s
tmux send-keys "cd ~/cadcorp-cloud/cadcorp-cloud-gitops/clusters/${az_tenant_id}/${CC_ENV} && direnv allow" Enter
tmux send-keys "k9s" Enter

tmux new-window
tmux rename-window docker
tmux send-keys "cd ~/cadcorp-cloud" Enter

tmux select-window -t 0

unset az_tenant_id
