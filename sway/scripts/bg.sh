#! /bin/bash

pkill swaybg
swaybg -o eDP-1 -i $(find ~/Projects/Artwork/Wallpaper/ | shuf -n 1) -m fill &