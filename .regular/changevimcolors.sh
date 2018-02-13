#!/bin/bash

# TODO improve this

HOUR=$(date +%H)

changecolor() {
    VIMS=$(vim --serverlist)
    for i in $VIMS; do
        vim --remote-send "<ESC>:set background=$1<CR>" --servername $i
    done
}

if [ 8 -le "${HOUR}" -a "${HOUR}" -lt 17 ]; then
    changecolor light
else
    changecolor dark
fi
