#!/bin/bash

volume=$(pamixer --get-volume-human)

# Check if it matches the headphone output
if [ "$volume" = "69%" ]; then
    makoctl dismiss; notify-send -a "" "Hunting time, enjoy your IEMs!" -i /home/longingly/Pictures/happy.png
    pamixer --set-volume 100 
else
    makoctl dismiss; notify-send -a "" "Back to the Sundies we go!" -i /home/longingly/Pictures/smug.png
    pamixer --set-volume 69 
fi
