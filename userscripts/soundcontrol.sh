echo Can you read me? | cowsay
hyprctl dispatch exec easyeffects > /dev/null
hyprctl dispatch exec pavucontrol-qt > /dev/null
killall kmix -9 > /dev/null
hyprctl dispatch exec kmix > /dev/null
sleep 0.1
