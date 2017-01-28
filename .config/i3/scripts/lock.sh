#!/bin/bash

scrot $HOME/Pictures/locked.png
convert $HOME/Pictures/locked.png -scale 5% -scale 2000% $HOME/Pictures/locked.png

if [[ -f $HOME/Pictures/lock.png ]] 
then
    # placement x/y
    PX=0
    PY=0
    # lockscreen image info
    R=$(file ~/Pictures/lock.png | grep -o '[0-9]* x [0-9]*')
    RX=$(echo $R | cut -d' ' -f 1)
    RY=$(echo $R | cut -d' ' -f 3)

    SR=$(xrandr --query | grep ' connected' | cut -f3 -d' ')
    for RES in $SR
    do
        # monitor position/offset
        SRX=$(echo $RES | cut -d'x' -f 1)                   # x pos
        SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
        SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
        SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset
        PX=$(($SROX + $SRX/2 - $RX/2 +1550))
        PY=$(($SROY + $SRY/2 - $RY/2 +900))

        convert $HOME/Pictures/locked.png $HOME/Pictures/lock.png -geometry +$PX+$PY -composite -matte $HOME/Pictures/locked.png
        echo "done"
    done
fi 

# i3lock  -I 10 -d -e -u -n -i $HOME/Pictures/locked.png
i3lock -e -u -n -i $HOME/Pictures/locked.png
