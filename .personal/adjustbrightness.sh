#!/bin/bash

time=$(date +%H%M)
DAY=$(date +%m-%d)
LINE=($(grep ^${DAY} ~/.regular/daylight_time.txt))
LIGHT=(xx 0.2 0.47 0.73 1 1 0.73 0.47 0.2)

# w should display the displays, weirdly enough this does not work
# export DISPLAY=$(w "$(id -un)" | awk 'NF > 7 && $2 ~ /tty[0-9]+/ {print $3; exit}' 2>/dev/null)
export DISPLAY=":0"

function interpolate() {
    first=$1
    second=$(($first + 1))

    interp=$(bc <<< "
    l_one = ${LINE[${first}]}; l_two = ${LINE[${second}]};
    v_one = ${LIGHT[${first}]}; v_two = ${LIGHT[${second}]};
    time=${time};
    scale = 2;

    reltimdif = l_two - l_one;
    valdif = v_two - v_one;

    ((time - l_one) * valdif / reltimdif) + v_one")
    echo ${interp}
}

source ~/.bash_commands

if (( ${time} < ${LINE[1]} )); then
    intensity=0.2
elif (( ${time} < ${LINE[2]} )); then
    intensity=$(interpolate 1)
elif (( ${time} < ${LINE[3]} )); then
    intensity=$(interpolate 2)
elif (( ${time} < ${LINE[4]} )); then
    intensity=$(interpolate 3)
elif (( ${time} < ${LINE[5]} )); then
    intensity=1
elif (( ${time} < ${LINE[6]} )); then
    intensity=$(interpolate 5)
elif (( ${time} < ${LINE[7]} )); then
    intensity=$(interpolate 6)
elif (( ${time} < ${LINE[8]} )); then
    intensity=$(interpolate 7)
elif (( ${LINE[8]} < ${time} )); then
    intensity=0.2
fi
setbrightness ${intensity}

xsetroot -bitmap ~/.config/background.bmp -fg "#aa99aa" -bg "#996699"
