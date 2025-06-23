#!/usr/bin/env -S fish -N

cat ~/Coding/password.txt | su -c 'nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=100"' > /dev/null
echo "Setting fan speed to max"
gamemoderun mangohud $argv
cat ~/Coding/password.txt | su -c 'nvidia-settings -a "[gpu:0]/GPUFanControlState=0"' > /dev/null
echo "Resetting fan speed to normal"
