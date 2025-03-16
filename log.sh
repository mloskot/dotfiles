#!/bin/bash
caller=$(basename "${1}")

function echolog
{
    echo -n "$(printf '%(%F %T)T') ${caller} " >&2
    echo -e "\033[32;1mINFO:\033[0m $*" >&2
}

function echoerr
{
    echo -n "$(printf '%(%F %T)T') ${caller} " >&2
    echo -e "\033[31;1mERROR:\033[0m $*" >&2
}
