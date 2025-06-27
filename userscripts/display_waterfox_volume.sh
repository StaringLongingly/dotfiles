#!/bin/bash

percentage=$(wpctl get-volume $(wpctl status | grep -oP '^\s*\K\d+(?=\. Waterfox\s*$)') | gawk -F "." '{print $2}')
makoctl dismiss
notify-send -a "Lapis Lazuli" "Waterfox Volume Successfully set at $percentage%" -e -i /home/longingly/Pictures/lapis_chilling.jpg
