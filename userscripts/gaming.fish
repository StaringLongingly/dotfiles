#!/usr/bin/env -S fish -N
cat ~/Coding/password.txt | su -c 'nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=100"' > /dev/null
echo "Setting fan speed to max"
gamemoderun gamescope -f --mangoapp -W 1920 -H 1080 -w 1920 -h 1080 -r 240 --force-grab-cursor -- $argv
cat ~/Coding/password.txt | su -c 'nvidia-settings -a "[gpu:0]/GPUFanControlState=0"' > /dev/null
echo "Resetting fan speed to normal"
