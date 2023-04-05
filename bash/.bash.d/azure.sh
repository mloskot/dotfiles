#!/bin/bash

# Azure CLI
alias a='az'
alias ak='az aks'
alias aks='az aks show --query "{Name:name,Status:provisioningState,Power:powerState.code}"'
