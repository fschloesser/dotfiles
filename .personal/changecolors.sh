#!/bin/bash

# TODO improve this

HOUR=$(date +%H)

changecolor() {
    # change vim color
    VIMS=$(vim --serverlist)
    for i in $VIMS; do
        vim --remote-send "<ESC>:set background=$1<CR>" --servername $i
    done
}

if [ 8 -le "${HOUR}" -a "${HOUR}" -lt 17 ]; then
    echo "day"
    changecolor light
    cp ~/.config/terminator/config_day ~/.config/terminator/config
else
    echo "night"
    changecolor dark
    cp ~/.config/terminator/config_night ~/.config/terminator/config
fi
