#!/usr/bin/env bash

op=$(echo -e "  Shutdown\n   Reboot\n   Suspend\n   Hibernate\n   Logout" | fuzzel --dmenu --width=36 --lines=5 | awk '{print tolower($2)}')

case $op in 
        shutdown)
                loginctl poweroff
                ;;
        reboot)
                loginctl reboot
                ;;
        suspend)
                loginctl suspend
                ;;
        hibernate)
                loginctl hibernate
                ;;
        logout)
                pkill -KILL -u $(whoami)
                ;;
esac