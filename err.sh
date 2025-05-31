#!/bin/bash
trap 'echo EXIT $? on line $LINENO in $BASH_COMMAND; trap - ERR; return 2>/dev/null || exit' ERR
