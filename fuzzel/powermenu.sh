#!/usr/bin/env bash

op=$(echo -e "   Shutdown\n   Reboot\n   Hibernate\n   Lock\n   Logout" | fuzzel --dmenu --width=36 --lines=5 | awk '{print tolower($2)}')

case $op in 
        shutdown)
                loginctl poweroff
                ;;
        reboot)
                loginctl reboot
                ;;
        hibernate)
                loginctl hibernate
                ;;
        lock)
                waylock -init-color 0x1E1E2E -input-color 0xB4BEFE -fail-color 0xF38BA8
                ;;
        logout)
                pkill -KILL -u $(whoami)
                ;;
esac
