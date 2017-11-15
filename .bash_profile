# setterm -blength 0

if [ -x "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1]; then
    exec startx
fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
