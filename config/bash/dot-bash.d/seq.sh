#!/bin/bash

if command -v "seqcli" >/dev/null; then
  return
fi

for c in \
  /opt/datalust/seqcli-2025*/seqcli \
  /opt/datalust/seqcli/seqcli
do
  if command -v "${c}" >/dev/null; then
    PATH="${PATH}:$(dirname "$(command -v "${c}")")"
    break
  fi
done

export PATH
