#!/bin/bash

volume=$(pamixer --get-volume-human)

# Check if it matches the headphone output
if [ "$volume" = "44%" ]; then
    makoctl dismiss; notify-send -a "" "Setting Master Volume to 69%" -i /home/longingly/Pictures/happy.png
    pamixer --set-volume 69
else
    makoctl dismiss; notify-send -a "" "Setting Master Volume to 44%" -i /home/longingly/Pictures/smug.png
    pamixer --set-volume 44
fi
