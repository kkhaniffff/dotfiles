#!/bin/sh

entries=$(pass git ls-files '*.gpg' | sed 's/\.gpg$//')
selected=$(echo "$entries" | tofi --prompt-text "Select password:")

[ -z "$selected" ] && exit

if timeout 2s pass show -c "$selected"; then
    notify-send "Password manager" "Copied to clipboard!"
    exit 0
fi

# If GPG requires passphrase, spawn a new terminal with the pinentry
alacritty --title "GPG Pinentry" -e sh -c '
    pass show -c "$1" && notify-send "Password manager" "Copied to clipboard!"
' sh "$selected"
