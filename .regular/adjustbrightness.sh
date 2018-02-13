#!/bin/bash
# TODO improve this

HOUR=$(date +%H)

# w should display the displays, weirdly enough this does not work
# export DISPLAY=$(w "$(id -un)" | awk 'NF > 7 && $2 ~ /tty[0-9]+/ {print $3; exit}' 2>/dev/null)

export DISPLAY=":0"
setbrightness(){
    # Adjust the brightness level for each monitor
    OUT=$(xrandr --listactivemonitors | awk 'NR!=1{print " "$NF" "}')
    for i in "${OUT[@]}"; do xrandr --output "${i// /}" --brightness "$1"; done
}

if [ 7 -le "${HOUR}" -a "${HOUR}" -lt 9 ]; then
    setbrightness 0.5
elif [ 9 -le "${HOUR}" -a "${HOUR}" -lt 10 ]; then
    setbrightness 0.7
elif [ 10 -le "${HOUR}" -a "${HOUR}" -lt 15 ]; then
    setbrightness 1
elif [ 15 -le "${HOUR}" -a "${HOUR}" -lt 16 ]; then
    setbrightness 0.7
elif [ 16 -le "${HOUR}" -a "${HOUR}" -lt 17 ]; then
    setbrightness 0.5
else
    setbrightness 0.3
fi
