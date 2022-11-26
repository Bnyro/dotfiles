#! /bin/bash

pkill swaybg
swaybg -o eDP-1 -i $(find ~/Documents/Media/Wallpaper/ | shuf -n 1) -m fill &