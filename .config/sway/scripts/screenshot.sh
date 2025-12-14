#!/bin/sh

case $1 in
    "copy") grim -g "$(slurp)" - | wl-copy -t image/png ;;
    "extract-text") slurp | xargs -I {} grim -s 2 -t png -g {} - | tesseract - - | wl-copy -n ;;
    *) slurp | grim -t png -g - $HOME/pictures/screenshots/$(date +"screenshot_%Y-%m-%dT%H:%M:%S.png") ;;
esac
