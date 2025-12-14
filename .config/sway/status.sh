#!/bin/sh

# ---------------- Backlight ----------------
val=$(cat /sys/class/backlight/*/brightness)
max=$(cat /sys/class/backlight/*/max_brightness)
pct=$(expr $val \* 100 / $max)
if [ "$pct" -ge 66 ]; then
    bl_icon="󰃠"
elif [ "$pct" -ge 33 ]; then
    bl_icon="󰃟"
else
    bl_icon="󰃞"
fi
backlight="$bl_icon $pct%"

# ---------------- Battery ----------------
cap=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)
if [ "$cap" -ge 80 ]; then
    bat_icon="󰁹"
elif [ "$cap" -ge 60 ]; then
    bat_icon="󰂀"
elif [ "$cap" -ge 40 ]; then
    bat_icon="󰂁"
elif [ "$cap" -ge 20 ]; then
    bat_icon="󰂂"
else
    bat_icon="󰁺"
fi
[ "$status" = "Charging" ] && bat_icon="󰂄"
battery="$bat_icon $cap%"

# ---------------- Network ----------------
wifi=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
if [ -n "$wifi" ]; then
    net_icon="󰖩"
    network="$net_icon $wifi"
else
    if ip link show | grep -q "state UP.*eth"; then
        network="󰈀"
    else
        network="󰖪"
    fi
fi

# ---------------- Volume ----------------
vol_line=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
vol_val=$(echo "$vol_line" | awk '{printf "%d\n", $2 * 100}')
echo "$vol_line" | grep -q "\[MUTED\]"
if [ $? -eq 0 ]; then
    vol_icon="󰖁"
else
    vol_icon="󰖀"
fi
volume="$vol_icon $vol_val%"

# ---------------- Clock ----------------
clock="$(date '+󰥔 %H:%M 󰃭 %a %Y-%m-%d')"

# ---------------- Combine ----------------
echo "$backlight | $battery | $network | $volume | $clock "
