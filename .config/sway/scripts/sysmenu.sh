#!/bin/sh

menu_cmd="$@"

options="Lock\nPoweroff\nReboot\nSuspend\nLogout"

action=$(echo "$options" | $menu_cmd --prompt-text "Select action:")

[ -z "$action" ] && exit

confirm=$(echo "Yes\nNo" | $menu_cmd --prompt-text "Confirm $action?")

if [ "$confirm" = "Yes" ]; then
    case "$action" in
        Lock) swaylock -f ;;
        Poweroff) systemctl poweroff ;;
        Reboot) systemctl reboot ;;
        Suspend) systemctl suspend ;;
        Logout) swaymsg exit ;;
    esac
fi
