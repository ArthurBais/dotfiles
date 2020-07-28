#!/bin/sh

if [ $(pulsemixer --get-mute) -eq 0 ] 
then
    echo 🔉$(pulsemixer --get-volume | cut -d' ' -f1)%
elif [ $(pulsemixer --get-mute) -eq 1 ] 
then
    echo 🔇
fi
