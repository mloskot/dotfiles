#!/bin/bash

tmux rename-window kubectl
tmux send-keys "cd ~/cadcorp-cloud" Enter

for CC_ENV in prd svc tst ; do
  export AZURE_CONFIG_DIR="${HOME}/.azure-${CC_ENV}"
  az_tenant_id=$(az account show --query homeTenantId --output tsv)
  if [[ -z "${az_tenant_id}" ]]; then
    echo "az_tenant_id is empty despite AZURE_CONFIG_DIR=${AZURE_CONFIG_DIR}"
    exit 1
  fi

  tmux set-environment AZURE_CONFIG_DIR "${AZURE_CONFIG_DIR}"
  tmux set-environment CC_ENV "${CC_ENV}"
  if [[ "${CC_ENV}" != "prd" ]]; then
    tmux split-window -v
  fi
  tmux send-keys "cd ~/cadcorp-cloud/cadcorp-cloud-gitops/clusters/${az_tenant_id}/${CC_ENV}" Enter
  tmux send-keys "direnv allow" Enter
  tmux send-keys "viddy --interval 3 --differences kubectl get events -A --field-selector type!=Normal --sort-by='.lastTimestamp'" Enter

  unset AZURE_CONFIG_DIR
  unset az_tenant_id
done

tmux select-pane -t 0
tmux select-layout even-vertical
