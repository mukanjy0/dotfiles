urxvtd -o -q -f
xrdb -merge ~/.config/X11/.Xresources
xmodmap ~/.Xmodmap
udiskie &
sxhdk &
exec i3
