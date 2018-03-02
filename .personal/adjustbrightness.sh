#!/bin/bash

time=$(date +%H%M)
DAY=$(date +%m-%d)
LINE=($(grep ^${DAY} ~/.personal/daylight_time.txt))
LIGHT=(xx 0.2 0.4 0.6 1.0 1.0 0.6 0.4 0.2)

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

if (( 10#${time} < 10#${LINE[1]} || 10#${LINE[8]} < 10#${time} )); then
    echo "one"
    intensity=0.2
    color_fg=${rgb_darkmidnight}
    color_bg=${rgb_lightmidnight}
elif (( 10#${time} < 10#${LINE[2]} )); then
    echo "two"
    intensity=$(interpolate 1)
    color_fg=${rgb_pink}
    color_bg=${rgb_rose}
elif (( 10#${time} < 10#${LINE[3]} )); then
    echo "three"
    intensity=$(interpolate 2)
    color_fg=${rgb_papaya_whip}
    color_bg=${rgb_moccasin}
elif (( 10#${time} < 10#${LINE[4]} )); then
    echo "vier"
    intensity=$(interpolate 3)
    color_fg=${rgb_alice_blue}
    color_bg=${rgb_lavender}
elif (( 10#${time} < 10#${LINE[5]} )); then
    echo "fuenf"
    intensity=1
    color_fg=${rgb_lightpurple}
    color_bg=${rgb_darkpurple}
elif (( 10#${time} < 10#${LINE[6]} )); then
    echo "sechs"
    intensity=$(interpolate 5)
    color_fg=${rgb_alice_blue}
    color_bg=${rgb_lavender}
elif (( 10#${time} < 10#${LINE[7]} )); then
    echo "sieben"
    intensity=$(interpolate 6)
    color_fg=${rgb_papaya_whip}
    color_bg=${rgb_moccasin}
elif (( 10#${time} < 10#${LINE[8]} )); then
    echo "acht"
    intensity=$(interpolate 7)
    color_fg=${rgb_pink}
    color_bg=${rgb_rose}
fi

echo $intensity
setbrightness ${intensity}

changecolor() {
    # change vim color
    VIMS=$(vim --serverlist)
    for i in $VIMS; do
        vim --remote-send "<ESC>:set background=$1<CR>" --servername $i
    done
}

if (( 10#${LINE[4]} < 10#${time} && 10#${time} < 10#${LINE[5]} )); then
    changecolor light
    cp ~/.config/terminator/config_day ~/.config/terminator/config
else
    changecolor dark
    cp ~/.config/terminator/config_night ~/.config/terminator/config
fi

# darkblue    xsetroot -bitmap background.bmp -fg ${rgb_darkmidnight} -bg ${rgb_lightmidnight}
# purple      xsetroot -bitmap background.bmp -fg ${rgb_lightpurple} -bg ${rgb_darkpurple}
# white       xsetroot -bitmap background.bmp -fg ${rgb_alice_blue} -bg ${rgb_lavender}
# yellow      xsetroot -bitmap background.bmp -fg ${rgb_papaya_whip} -bg ${rgb_moccasin}
# red         xsetroot -bitmap background.bmp -fg ${rgb_pink} -bg ${rgb_rose}
xsetroot -bitmap ~/.personal/background.bmp -fg "${color_fg}" -bg "${color_bg}"
