[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

###########################
##### Keyboard
###########################
# set american keyboard layout
# setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
setxkbmap us
# make capslock yet another ctrl
# to revert just type `setxkbmap -option`
setxkbmap -option ctrl:nocaps
# use xmodmap to configure easy German umlauts and sharp s

if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

exec i3

