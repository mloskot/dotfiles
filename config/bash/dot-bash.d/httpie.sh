#!/bin/bash
if ! command -v "httpie" >/dev/null; then
    return
fi

# work around https://github.com/httpie/cli/issues/1202
if [[ -f /etc/ssl/certs/ca-certificates.crt ]]; then
  REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
  export REQUESTS_CA_BUNDLE
fi
