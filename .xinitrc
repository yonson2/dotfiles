xrandr --dpi 276
xrdb -merge ~/.Xresources
setxkbmap -layout gb -option caps:escape
xinput disable 10
xinput --set-prop 'DLL075B:01 06CB:76AF Touchpad' 'libinput Accel Speed' 1
exec i3
