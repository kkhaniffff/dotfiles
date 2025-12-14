#!/bin/sh

options="Lock\nPoweroff\nReboot\nSuspend\nLogout"
action=$(echo "$options" | tofi --prompt-text "Select action:")

[ -z "$action" ] && exit

confirm=$(echo "Yes\nNo" | tofi --prompt-text "Confirm $action?")

if [ "$confirm" = "Yes" ]; then
    case "$action" in
        Lock) playerctl pause; swaylock -f ;;
        Poweroff) systemctl poweroff ;;
        Reboot) systemctl reboot ;;
        Suspend) systemctl suspend ;;
        Logout) swaymsg exit ;;
    esac
fi
