urxvtd -o -q -f
xrdb -merge ~/.config/X11/.Xresources
setxkbmap -option caps:super
udiskie &
sxhdk &
exec i3
