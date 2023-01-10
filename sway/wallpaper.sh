#! /bin/bash

pkill swaybg
swaybg -i $(find ~/Projects/Artwork/Wallpaper/ | shuf -n 1) -m fill &
