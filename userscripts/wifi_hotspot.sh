sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo ip addr add 192.168.88.1/24 dev wlan0

sudo killall -9 hostapd
sudo hostapd .config/hostapd.conf
