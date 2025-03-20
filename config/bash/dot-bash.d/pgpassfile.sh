#!/bin/bash

if [[ -f /c/Users/mateuszl/.pgpass ]]; then
    export PGPASSFILE=C:\\Users\\mateuszl\\.pgpass
    export PATH=$PATH:/c/Users/mateuszl/AppData/Local/Programs/pgAdmin\ 4/v6/runtime
fi

if [[ -f /mnt/c/Users/mateuszl/.pgpass ]]; then
    export PGPASSFILE=/mnt/c/Users/mateuszl/.pgpass
fi
