#!/bin/sh

# Volume
vol_line=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
vol_val=$(echo "$vol_line" | awk '{printf "%d\n", $2 * 100}')
if echo "$vol_line" | grep -q "MUTED"; then
    vol_icon="󰖁"
elif [ "$vol_val" -ge 50 ]; then
    vol_icon="󰕾"
else
    vol_icon="󰖀"
fi
volume="$vol_icon $vol_val%"

# Keyboard Layout
layout=$(swaymsg -t get_inputs \
    | grep -m1 "xkb_active_layout_name" \
    | sed 's/.*: "//;s/",.*//'
)
case "$layout" in
    *English*) layout="us" ;;
    *Russian*) layout="ru" ;;
esac
keyboard="󰌌 $layout"

# Network
wifi=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
if [ -n "$wifi" ]; then
    network="󰖩 $wifi"
elif ip link show | grep -q "state UP.*eth"; then
    network="󰈀"
else
    network="󰖪"
fi

# Clock
clock="$(date '+󰃭 %a %d %b 󰥔 %H:%M')"

# Combine
echo "$volume | $keyboard | $network | $clock "
