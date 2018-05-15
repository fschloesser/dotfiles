#!/bin/bash

time=$(date +%H%M)
DAY=$(date +%m-%d)
LINE=($(grep ^${DAY} ~/.personal/daylight_time.txt))

# adjust margin
LINE[3]=${LINE[4]}
LINE[6]=${LINE[5]}
LINE[4]=$(bc <<< "${LINE[3]}+300")
LINE[5]=$(bc <<< "${LINE[6]}-300")

# w should display the displays, weirdly enough this does not work
# export DISPLAY=$(w "$(id -un)" | awk 'NF > 7 && $2 ~ /tty[0-9]+/ {print $3; exit}' 2>/dev/null)
export DISPLAY=":0"

changecolor() {
    # change vim color
    VIMS=$(vim --serverlist)
    for i in $VIMS; do
        vim --remote-send "<ESC>:set background=$1<CR>" --servername $i
    done
}

if (( 10#${LINE[4]} < 10#${time} && 10#${time} < 10#${LINE[5]} )); then
    echo "change color to light"
    changecolor light
    cp ~/.config/terminator/config_day ~/.config/terminator/config
else
    echo "change color to dark"
    changecolor dark
    cp ~/.config/terminator/config_night ~/.config/terminator/config
fi

