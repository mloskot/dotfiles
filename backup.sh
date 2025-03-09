#!/bin/bash

function backup
{
  backup_src=${1}
  backup_dst="${backup_src}.$(date +%Y%m%dT%H%M%S)"

  if [[ -L "${backup_src}" ]]; then
    echolog "${backup_src} is already symbolic link. Skipping backup."
    return 0
  fi

  echolog "Backing up ${backup_src} to ${backup_dst}"
  if [[ ! -f "${backup_src}" && ! -d "${backup_src}" ]]; then
    echoerr "${backup_src} not found"
    exit 1
  fi
  
  echolog "Backing up ${backup_src} to ${backup_dst}"
  mv -f "${backup_src}" "${backup_dst}"
}
