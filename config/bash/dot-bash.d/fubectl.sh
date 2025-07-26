#!/bin/bash
if test ! -f ~/.config/fubectl/fubectl.source; then
  return
fi

if command -v "viddy" >/dev/null; then
  export FUBECTL_WATCH_CMD=viddy
fi

source ~/.config/fubectl/fubectl.source
