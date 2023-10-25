#! /bin/bash

pkill swaybg
swaybg -i $(find /usr/share/backgrounds -name '*.jpg' -o -name '*.png' | shuf -n 1) -m fill &
