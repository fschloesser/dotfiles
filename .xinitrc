[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

###########################
##### Keyboard
###########################
# set american keyboard layout
# setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
setxkbmap us
# make capslock yet another ctrl
setxkbmap -option ctrl:nocaps
# use xmodmap to configure easy German umlauts and sharp s
xmodmap ~/.Xmodmap

exec i3

