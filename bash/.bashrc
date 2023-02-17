#!/bin/bash
echo "Loading ~/.bashrc"

if [ -d ~/.bash.d ]; then
  for f in ~/.bash.d/*.sh; do
    if [ -r $f ]; then
        echo "Loading $f"
      . "$f"
    fi
  done
  unset f
fi
