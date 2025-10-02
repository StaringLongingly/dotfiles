echo Can you read me? | cowsay
hyprctl dispatch -- exec element-desktop --password-store="gnome-libsecret" > /dev/null
hyprctl dispatch exec flatpak run com.viber.Viber > /dev/null
sleep 0.1
