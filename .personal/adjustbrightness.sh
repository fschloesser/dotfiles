#!/bin/bash

time=$(date +%H%M)
DAY=$(date +%m-%d)
LINE=($(grep ^${DAY} ~/.personal/daylight_time.txt))
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
source ~/.personal/colors.sh

color_fg=${rgb_lightpurple}
color_bg=${rgb_darkpurple}

# if (( ${time} < ${LINE[1]} )); then
# if (( ${LINE[8]} < ${time} )); then
intensity=0.2
color_fg=${rgb_lightblue}
color_bg=${rgb_darkblue}

if (( ${time} < ${LINE[2]} )); then
    intensity=$(interpolate 1)
    color_fg=${rgb_lightred}
    color_bg=${rgb_darkorange}
elif (( ${time} < ${LINE[3]} )); then
    intensity=$(interpolate 2)
    color_fg=${rgb_lightyellow}
    color_bg=${rgb_darkorange}
elif (( ${time} < ${LINE[4]} )); then
    intensity=$(interpolate 3)
    color_fg=${rgb_lightyellow}
    color_bg=${rgb_darkblue}
elif (( ${time} < ${LINE[5]} )); then
    intensity=1
    color_fg=${rgb_lightpurple}
    color_bg=${rgb_darkpurple}
elif (( ${time} < ${LINE[6]} )); then
    intensity=$(interpolate 5)
    color_fg=${rgb_lightyellow}
    color_bg=${rgb_darkblue}
elif (( ${time} < ${LINE[7]} )); then
    intensity=$(interpolate 6)
    color_fg=${rgb_lightyellow}
    color_bg=${rgb_darkorange}
elif (( ${time} < ${LINE[8]} )); then
    intensity=$(interpolate 7)
    color_fg=${rgb_lightred}
    color_bg=${rgb_darkorange}
fi

setbrightness ${intensity}
xsetroot -bitmap ~/.personal/background.bmp -fg "${color_fg}" -bg "${color_bg}"
