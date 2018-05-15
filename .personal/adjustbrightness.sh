#!/bin/bash

time=$(date +%H%M)
DAY=$(date +%m-%d)
LINE=($(grep ^${DAY} ~/.personal/daylight_time.txt))
LIGHT=(xx xx xx 0.2 1.0 1.0 0.2 xx xx)

# adjust margin
LINE[3]=${LINE[4]}
LINE[6]=${LINE[5]}
LINE[4]=$(bc <<< "${LINE[3]}+300")
LINE[5]=$(bc <<< "${LINE[6]}-300")

# w should display the displays, weirdly enough this does not work
# export DISPLAY=$(w "$(id -un)" | awk 'NF > 7 && $2 ~ /tty[0-9]+/ {print $3; exit}' 2>/dev/null)
export DISPLAY=":0"

function interpolate() {
    first=$1
    second=$(($first + 1))

    # the line 'scale=2' is extremely important to enable division
    interp=$(bc <<< "
    l_one = ${LINE[${first}]}; l_two = ${LINE[${second}]};
    v_one = ${LIGHT[${first}]}; v_two = ${LIGHT[${second}]};
    time=${time};
    scale=2;

    reltimdif = l_two - l_one;
    valdif = v_two - v_one;

    ((time - l_one) * valdif / reltimdif) + v_one")
    echo ${interp}
}

# default bg_colors
color_fg='#aa99aa' #${rgb_lightpurple}
color_bg='#996699' #${rgb_darkpurple}

if (( 10#${time} < 10#${LINE[3]} || 10#${LINE[6]} < 10#${time} )); then
    echo "night"
    intensity=${LIGHT[3]}
elif (( 10#${time} < 10#${LINE[4]} )); then
    echo "early"
    intensity=$(interpolate 3)
elif (( 10#${time} < 10#${LINE[5]} )); then
    echo "day"
    intensity=1
elif (( 10#${time} < 10#${LINE[6]} )); then
    echo "late"
    intensity=$(interpolate 5)
fi

source ~/.bash_commands

# colors for background
colorsfile='colors/colorstable.txt'
epoch=$(date +%s)
nlines=$(cat ${colorsfile} |wc -l )
rand1=$(bc <<< "${epoch}%${nlines}")
rand2=$(bc <<< "(${epoch}/10)%${nlines}")
color_bg=$(line ${colorsfile} ${rand1})
color_fg=$(line ${colorsfile} ${rand2})

echo $intensity
setbrightness ${intensity}

# purple      xsetroot -bitmap background.bmp -fg #aa99aa -bg #996699
xsetroot -bitmap ~/.personal/background.bmp -fg "${color_fg}" -bg "${color_bg}"
