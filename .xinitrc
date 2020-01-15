[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

###########################
##### Keyboard config in two files:
###########################
# tail of /usr/share/X11/xkb/symbols/us

# partial alphanumeric_keys
# xkb_symbols "fari" {
#
#   include "us(basic)"
#   name[Group1]= "English (with special characters)";
#
#   key <AD06> { [	   y,          Y,    adiaeresis,       Adiaeresis ] };
#   key <AC07> { [	   j,          J,    udiaeresis,       Udiaeresis ] };
#   key <AC09> { [	   l,          L,    odiaeresis,       Odiaeresis ] };
#
#   key <AC02> { [	   s,          S,        ssharp,          ssharp  ] };
#   key <AE05> { [	   5,    percent,      EuroSign,         NoSymbol ] };
#
#   key <AC01> { [	   a,          A,        aacute,           Aacute ] };
#   key <AD03> { [	   e,          E,        eacute,           Eacute ] };
#   key <AD07> { [	   u,          U,        uacute,           Uacute ] };
#   key <AD08> { [	   i,          I,        iacute,           Iacute ] };
#   key <AD09> { [	   o,          O,        oacute,           Oacute ] };
#   key <AB06> { [	   n,          N,        ntilde,           Ntilde ] };
#
#   include "level3(ralt_switch)"
#   include "compose(rctrl)"
# };
#

# full file /etc/default/keyboard

# # KEYBOARD CONFIGURATION FILE
#
# # Consult the keyboard(5) manual page.
#
# XKBMODEL="pc105"
# XKBLAYOUT="us,ru"
# XKBVARIANT="fari,comon"
# XKBOPTIONS="ctrl:nocaps,grp:alt_space_toggle"
#
# BACKSPACE="guess"

###########################
##### Keyboard quick
###########################
# set american keyboard layout
# setxkbmap -layout "us,ru" -option "grp:alt_space_toggle"
# setxkbmap -layout us -option
#setxkbmap us
#
# make capslock yet another ctrl
# to revert just type `setxkbmap -option`
#setxkbmap -option ctrl:nocaps
#
# use xmodmap to configure easy German umlauts and sharp s
#if [ -s ~/.Xmodmap ]; then
#    xmodmap ~/.Xmodmap
#fi


# notification service
#systemctl --user enable dunst

exec i3

